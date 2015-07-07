FROM fedora
MAINTAINER dkl@mozilla.com

# Environment
ENV USER bugzilla
ENV HOME /home/$USER
ENV GITHUB_BASE_GIT https://git.mozilla.org/www/bugzilla.org
ENV GITHUB_BASE_BRANCH master

# Packages
COPY rpm_list /rpm_list
RUN dnf -y -q install `cat /rpm_list` && dnf clean all

# User creation
RUN useradd -m -G wheel -u 1000 -s /bin/bash $USER

# Sudoer configuration
COPY sudoers /etc/sudoers
RUN chown root.root /etc/sudoers && chmod 440 /etc/sudoers

# Clone the code repo
RUN su $BUGZILLA_USER -c "git clone $GITHUB_BASE_GIT -b $GITHUB_BASE_BRANCH $HOME/www.bugzilla.org"

# Perl dependencies
COPY cpanfile $HOME/cpanfile
RUN cd $HOME && cpanm --quiet --notest --installdeps .

# Final permissions fix
RUN chown -R $USER.$USER /home/$USER

# Miscellaneous
ADD ldp.dsl /usr/share/sgml/docbook/dsssl-stylesheets-1.79/dtds/decls/ldp.dsl
