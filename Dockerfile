FROM fedora:latest
RUN dnf -y install cmake
RUN dnf -y install gcc gcc-c++
RUN dnf -y install openmpi
