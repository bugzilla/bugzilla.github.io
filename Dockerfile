FROM fedora
MAINTAINER dkl@mozilla.com

# Environment
ENV USER bugzilla
ENV HOME /home/$USER
ENV GITHUB_BASE_GIT https://github.com/bugzilla
ENV GITHUB_BASE_BRANCH master

# Packages
COPY docker /docker
RUN dnf -y install `cat /docker/rpm_list` \
    && dnf clean all

# User creation
# User configuration
RUN useradd -m -G wheel -u 1000 -s /bin/bash $USER \
    && passwd -u -f $USER \
    && echo "bugzilla:bugzilla" | chpasswd
RUN cp /docker/bash_profile $HOME/.bash_profile

# Sudoer configuration
RUN cp /docker/sudoers /etc/sudoers \
    && chown root.root /etc/sudoers \
    && chmod 440 /etc/sudoers

# Clone the web and build epo
RUN su $USER -c "git clone $GITHUB_BASE_GIT/bugzilla.github.io -b $GITHUB_BASE_BRANCH $HOME/bugzilla.github.io"
RUN su $USER -c "cd $HOME/bugzilla.github.io && bundle install"
RUN su $USER -c "git clone $GITHUB_BASE_GIT/build -b $GITHUB_BASE_BRANCH $HOME/build"
RUN su $USER -c "git config --global user.name \"David Lawrence\"; git config --global user.email dkl@mozilla.com"

# Perl Dependencies
RUN cp docker/cpanfile . \ 
    && cpanm --quiet --notest --installdeps . \ 
    && rm -rf $HOME/.cpanm

# Final permissions fix
RUN chown -R $USER.$USER $HOME

EXPOSE 4000
