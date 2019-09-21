# Zybo and Yocto

This directory holds config files and a dockerfile to build Yocto on the Zybo
board.
It uses the `meta-xilinx-*` layers.

The script .`/buildrun.sh` builds the image and run a container.
The script `./exec.sh` allows to connect to an existing container.

This docker image depends on the `quickbuild` docker image in this same
repository.

Try it by executing:
  ```
  host$ ./buildrun.sh
  ```

WARNING: the build of the image requires more than 50GB of hard disk.
