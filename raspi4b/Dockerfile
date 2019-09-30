FROM yocto-quickbuild:latest

# Download Raspberry layers
WORKDIR ${WORKDIR}/poky/
RUN git clone https://github.com/agherzan/meta-raspberrypi.git --quiet

# Update configuration for Raspberry machine
WORKDIR ${WORKDIR}/poky/build/conf
RUN sed -i 's@MACHINE ??= "qemux86"@MACHINE ??= "raspberrypi4-64"@g' \
        ${WORKDIR}/poky/build/conf/local.conf

# Add Xilinx layers to configuration files
WORKDIR ${WORKDIR}/poky/
RUN source oe-init-build-env && \
    bitbake-layers add-layer ../meta-raspberrypi && \
    bitbake-layers show-layers

# Build target file system image
WORKDIR ${WORKDIR}/poky/
RUN source oe-init-build-env rpi-build && \
    bitbake core-image-base
