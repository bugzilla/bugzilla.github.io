FROM fedora
MAINTAINER dkl@mozilla.com

# Environment
ENV BUGZILLA_USER bugzilla
ENV BUGZILLA_HOME /home/$BUGZILLA_USER/devel/htdocs/bugzilla
ENV GITHUB_BASE_GIT https://git.mozilla.org/www/bugzilla.org
ENV GITHUB_BASE_BRANCH master
ENV CPANM cpanm --quiet --notest --skip-satisfied

# Packages
ADD rpm_list /rpm_list
RUN yum -y -q install `cat /rpm_list` && yum clean all

# User creation
RUN useradd -m -G wheel -u 1000 -s /bin/bash $BUGZILLA_USER
# Sudoer configuration
ADD sudoers /etc/sudoers
RUN chown root.root /etc/sudoers; chmod 440 /etc/sudoers

# Clone the code repo
RUN su $BUGZILLA_USER -c "git clone $GITHUB_BASE_GIT -b $GITHUB_BASE_BRANCH $BUGZILLA_HOME"

# Perl dependencies
RUN $CPANM App::SimpleHTTPServer \
    && $CPANM File::Copy::Recursive \
    && $CPANM File::Which \
    && $CPANM LWP::Protocol::https \
    && $CPANM Sort::Versions \
    && $CPANM Template

# Final permissions fix
RUN chmod 711 /home/$BUGZILLA_USER
RUN chown -R $BUGZILLA_USER.$BUGZILLA_USER /home/$BUGZILLA_USER

# Miscellaneous
ADD ldp.dsl /usr/share/sgml/docbook/dsssl-stylesheets-1.79/dtds/decls/ldp.dsl
