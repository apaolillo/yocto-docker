# Quickbuild

This directory holds config files and a dockerfile to run the *Yocto Project 
Quick Build* as documented on the website:
https://www.yoctoproject.org/docs/2.7.1/brief-yoctoprojectqs/brief-yoctoprojectqs.html

The script .`/buildrun.sh` builds the image and run a container.
The script `./exec.sh` allows to connect to an existing container.

Try it by executing:
  ```
  host$ ./buildrun.sh
  container$ source oe-init-build-env
  container$ runqemu qemux86 slirp nographic
  ```
This launches, in a container, a Embedded Linux OS distribution on QEMU
emulating an x86 machine.
