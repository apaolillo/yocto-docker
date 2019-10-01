FROM ubuntu:18.04

# Name of the user used to realise the yocto build
ENV USER_NAME=tony
ENV WORKDIR=/workspace

SHELL ["/bin/bash", "-c"]

# Install required packages for yocto build host
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        chrpath \
        cpio \
        debianutils \
        diffstat \
        file \
        gawk \
        gcc-multilib \
        git \
        git-core \
        iputils-ping \
        less \
        libegl1-mesa \
        libsdl1.2-dev \
        locales \
        python \
        python3 \
        python3-git \
        python3-jinja2 \
        python3-pexpect \
        python3-pip \
        socat \
        texinfo \
        unzip \
        vim \
        wget \
        xterm \
        xz-utils \
    && rm -rf /var/lib/apt/lists/*

# Setting-up locale for yocto build
RUN locale-gen en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Add a user for the yocto build (non-root requirement)
RUN useradd ${USER_NAME} \
        --shell /bin/bash \
        --home-dir ${WORKDIR} \
        --no-log-init

# Set workspace directory
WORKDIR ${WORKDIR}
RUN chown ${USER_NAME}:${USER_NAME} ${WORKDIR}

# Run the following as non-root
USER ${USER_NAME}

# Get poky repo.
RUN git clone git://git.yoctoproject.org/poky --quiet 2>&1 && \
    cd poky && \
    git checkout tags/yocto-2.7.1 -b my-yocto-2.7.1 2>&1

# Initialize the Build Environment and add mirrors
COPY conf ${WORKDIR}/conf
WORKDIR ${WORKDIR}/poky/
RUN sed -i 's$"https://www.example.com/"$"https://xkcd.com/"$' \
        ${WORKDIR}/poky/meta/conf/distro/include/default-distrovars.inc && \
    source oe-init-build-env && \
    cat ${WORKDIR}/conf/mirrors.conf \
        >> ${WORKDIR}/poky/build/conf/local.conf

# Automatically source bash with oe-init-build-env
# Allows `bitbake` and other commands to be in path.
COPY --chown=${USER_NAME}:${USER_NAME} scripts/bashrc.sh /tmp/
RUN cat /tmp/bashrc.sh >> ~/.bashrc && rm /tmp/bashrc.sh

WORKDIR ${WORKDIR}/poky/
