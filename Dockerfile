FROM fedora
MAINTAINER dkl@mozilla.com

# Environment
ENV USER bugzilla
ENV HOME /home/$USER
ENV GITHUB_BASE_GIT https://git.mozilla.org/www/bugzilla.org
ENV GITHUB_BASE_BRANCH master

# Packages
COPY files /files
RUN dnf -y -q install `cat /files/rpm_list` \
    && dnf clean all

# User creation
# User configuration
RUN useradd -m -G wheel -u 1000 -s /bin/bash $USER \
    && passwd -u -f $USER \
    && echo "bugzilla:bugzilla" | chpasswd
RUN cp /files/bash_profile $HOME/.bash_profile

# Sudoer configuration
RUN cp /files/sudoers /etc/sudoers \
    && chown root.root /etc/sudoers \
    && chmod 440 /etc/sudoers

# Clone the code repo
RUN su $USER -c "git clone $GITHUB_BASE_GIT -b $GITHUB_BASE_BRANCH $HOME/www.bugzilla.org" \
    && su $USER -c "git config --global user.name \"David Lawrence\"; git config --global user.email dkl@mozilla.com"

# Perl dependencies
RUN cp /files/cpanfile $HOME/cpanfile \
    && cd $HOME \
    && cpanm --quiet --notest --installdeps . \
    && rm -rf $HOME/.cpanm

# Custom operations
RUN /bin/bash /files/my_config.sh

# Final permissions fix
RUN chown -R $USER.$USER $HOME
