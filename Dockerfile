FROM fedora:30
RUN dnf -y install cmake gcc gcc-c++ git make perl wget
RUN mkdir -p /sources
RUN cd /sources &&\
    wget https://download.open-mpi.org/release/open-mpi/v3.1/openmpi-3.1.6.tar.gz &&\
    tar -xf openmpi-3.1.6.tar.gz &&\
    cd openmpi-3.1.6 &&\
    mkdir build &&\
    cd build &&\
    ../configure --prefix=/usr/local/ &&\
    make -j 4 all &&\
    make install &&\
    cd / &&\
    rm -fr /sources/openmpi*
RUN cd /sources &&\
    wget https://www.vtk.org/files/release/8.2/VTK-8.2.0.tar.gz &&\
    tar -xf VTK-8.2.0.tar.gz &&\
    cd VTK-8.2.0 &&\
    mkdir build &&\
    cd build &&\
    cmake -DVTK_Group_Imaging=OFF -DVTK_Group_MPI=ON -DVTK_Group_Qt=OFF -DVTK_Group_Rendering=OFF -DVTK_Group_StandAlone=ON -DVTK_Group_Tk=OFF -DVTK_Group_Views=OFF -DVTK_Group_Web=OFF -DVTK_RENDERING_BACKEND=None .. &&\
    make -j4 &&\
    make install &&\
    cd / &&\
    rm -fr /sources/VTK*
