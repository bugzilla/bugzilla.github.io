#!/bin/bash
# Add any custom setup instructions here

export CPANM="cpanm --quiet --notest --skip-satisfied"

# RPM dependencies
dnf -q -y install vim-enhanced findutils

# Perl dependencies
$CPANM IPC::System::Simple
$CPANM Term::ReadKey
$CPANM App::SimpleHTTPServer
$CPANM Email::Sender;
$CPANM GraphViz
$CPANM HTML::FormatText::WithLinks
$CPANM JSON::RPC::Client
$CPANM Net::RabbitMQ
$CPANM Net::SMTP::SSL
$CPANM REST::Client
$CPANM Text::MultiMarkdown

# Bugzilla dev manager configuration
git clone https://github.com/dklawren/bugzilla-dev-manager.git \
    -b app $HOME/bugzilla-dev-manager
cd $HOME/bugzilla-dev-manager && $CPANM --installdeps .
mkdir $HOME/bin
ln -sf $HOME/bugzilla-dev-manager/bz $HOME/bin/bz
cp $HOME/bugzilla-dev-manager/bz-dev.conf-sample /etc/bz-dev.conf

# Home dotfiles
git clone https://github.com/dklawren/homedir $HOME/homedir
cd $HOME/homedir && ./makedotfiles.sh

# Vim configuration
git clone https://github.com/dklawren/dotvim $HOME/.vim
cd $HOME/.vim
git submodule update --init
ln -sf $HOME/.vim/rc/vimrc $HOME/.vimrc
git clone https://github.com/powerline/fonts.git $HOME/powerline-fonts
cd $HOME/powerline-fonts && ./install.sh

# Remove CPAN build files to minimize disk usage
rm -rf ~/.cpan*
