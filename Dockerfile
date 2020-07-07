FROM fedora:latest
RUN dnf -y install cmake
RUN dnf -y install gcc gcc-c++
RUN dnf -y install openmpi
RUN dnf -y install wget
RUN mkdir -p /sources
RUN cd /sources
RUN wget https://www.vtk.org/files/release/8.2/VTK-8.2.0.tar.gz
RUN tar -xf VTK-8.2.0.tar.gz
RUN cd VTK-8.2.0
RUN mkdir build
RUN cd build
RUN cmake -DVTK_Group_Imaging=OFF -DVTK_Group_MPI=ON -DVTK_Group_Qt=OFF -DVTK_Group_Rendering=OFF -DVTK_Group_StandAlone=ON -DVTK_Group_Tk=OFF -DVTK_Group_Views=OFF -DVTK_Group_Web=OFF -DVTK_RENDERING_BACKEND=None ..
RUN make
RUN make install
