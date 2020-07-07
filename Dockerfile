FROM fedora:latest
RUN dnf -y install cmake gcc gcc-c++ openmpi wget
RUN mkdir -p /sources &&\
    cd /sources &&\
    wget https://www.vtk.org/files/release/8.2/VTK-8.2.0.tar.gz &&\
    tar -xf VTK-8.2.0.tar.gz &&\
    cd VTK-8.2.0 &&\
    mkdir build &&\
    cd build &&\
    cmake -DVTK_Group_Imaging=OFF -DVTK_Group_MPI=ON -DVTK_Group_Qt=OFF -DVTK_Group_Rendering=OFF -DVTK_Group_StandAlone=ON -DVTK_Group_Tk=OFF -DVTK_Group_Views=OFF -DVTK_Group_Web=OFF -DVTK_RENDERING_BACKEND=None .. &&\
    make &&\
    make install &&\
    cd / &&\
    rm -fr sources/VTK-8.2.0
