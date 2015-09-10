FROM fedora
MAINTAINER dkl@mozilla.com

# Environment
ENV USER bugzilla
ENV HOME /home/$USER
ENV GITHUB_BASE_GIT https://git.mozilla.org/www/bugzilla.org
ENV GITHUB_BASE_BRANCH master

# Packages
COPY files/rpm_list /rpm_list
RUN dnf -y -q install `cat /rpm_list` && dnf clean all

# User creation
RUN useradd -m -G wheel -u 501 -g 20 -s /bin/bash $USER
COPY files/bash_profile $HOME/.bash_profile

# Sudoer configuration
COPY files/sudoers /etc/sudoers
RUN chown root.root /etc/sudoers && chmod 440 /etc/sudoers

# Clone the code repo
RUN su $USER -c "git clone $GITHUB_BASE_GIT -b $GITHUB_BASE_BRANCH $HOME/www.bugzilla.org"
RUN su $USER -c "git config --global user.name \"David Lawrence\"; git config --global user.email dkl@mozilla.com"

# Perl dependencies
COPY files/cpanfile $HOME/cpanfile
RUN cd $HOME && cpanm --quiet --notest --installdeps .

# Final permissions fix
RUN chown -R 501.20 /home/$USER

# Miscellaneous
ADD files/ldp.dsl /usr/share/sgml/docbook/dsssl-stylesheets-1.79/dtds/decls/ldp.dsl
