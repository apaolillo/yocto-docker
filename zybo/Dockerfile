FROM yocto-quickbuild:latest

# Download xilinx layers
WORKDIR ${WORKDIR}/poky/
RUN git clone https://github.com/Xilinx/meta-xilinx.git --quiet

# Update configuration for Zybo machine
WORKDIR ${WORKDIR}/poky/build/conf
RUN sed -i 's@MACHINE ??= "qemux86"@MACHINE ??= "zybo-zynq7"@g' \
        ${WORKDIR}/poky/build/conf/local.conf

# Add Xilinx layers to configuration files
WORKDIR ${WORKDIR}/poky/
RUN source oe-init-build-env && \
    bitbake-layers add-layer ../meta-xilinx/meta-xilinx-* && \
    bitbake-layers show-layers

# Build target file system image
WORKDIR ${WORKDIR}/poky/
RUN source oe-init-build-env && \
    echo "Build command disabled. Please enable manually in Dockerfile." >&2
#    bitbake core-image-minimal
