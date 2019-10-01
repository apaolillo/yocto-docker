FROM yocto-base:latest

# Run build of the basic quickbuild example
WORKDIR ${WORKDIR}/poky/
RUN source oe-init-build-env && \
    bitbake core-image-sato
