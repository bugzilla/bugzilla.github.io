#!/usr/bin/perl -w

# Builds the website, acquiring a lock first so builds don't collide with
# each other.  Run this from the website root directory.  Pass command line
# options to the build script by first putting "--" on the command line,
# i.e. "build-exclusive.pl -- -v foo.html" runs "bin/build -v foo.html".

use strict;

# The number of seconds to wait before trying again if another build is going.
# Set this with the --wait command line option.
my $WAIT = 15;

# The maximum amount of time in seconds to wait for a lock before dying.
# Set this with the --maxwait command line option.
#
# If this script is being run periodically by cron, set this low (ideally less
# than the interval between cron runs; f.e. 30 seconds for a run that happens
# every minute) to prevent processes from building up.
#
# If this script gets run by CVS upon commit, set this high (f.e. 450 seconds,
# i.e. 15 minutes) so that multiple simultaneous commits all go through
# one after the other even if some of them have to wait a while.
#
my $MAX_WAIT = 30;

# Get any options passed on the command line, like --wait and --maxwait.
use Getopt::Long;
my $result = GetOptions ("wait=i"    => \$WAIT,
                         "maxwait=i" => \$MAX_WAIT);

# Use Proc::PID::File to handle the locking.
use Proc::PID::File;
my $LOCK_OPTS = {
    dir   => "/tmp",
    name  => "bugzillaorg-build",
    debug => 0
};

# Try to get a lock.
my $started = time();
my $waited = 0;
while (Proc::PID::File->running($LOCK_OPTS) && ((time()-$started)<=$MAX_WAIT)) {
    print STDERR "Couldn't get build lock; waiting another $WAIT seconds...\n";
    $waited = 1;
    sleep $WAIT ;
}

# Die if we couldn't get a lock.
if (Proc::PID::File->running($LOCK_OPTS)) {
    die "Couldn't get build lock.";
}
elsif ($waited) {
    print STDERR "Got build lock after " . (time() - $started) . " seconds.\n";
}

# Build the website.
#print STDERR "Building site.\n";
system("bin/build", @ARGV);
