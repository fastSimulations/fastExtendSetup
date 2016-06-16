#! /bin/bash

echo
echo "Fast-FC Setup Script for Foam-Extend-3.1"
echo

# patterns needed

neededPattern=(
	devel_qt4
	devel_C_C++
)
neededPackages=(
	gcc 
	gcc-c++
	gcc-fortran
	libstdc++-devel 
	mercurial 
	git 
	flex 
	bison 
	make 
	ccache 
	zlib-devel 
	rpm-build 
	binutils-devel 
	cmake 
	openmpi-devel 
	gnuplot 
	m4 
	libqt4
	libqt4-devel
	libQtWebKit-devel 
	python
	python-matplotlib
	python-devel
	ffmpeg
	mesa
	libphonon4
	freetype
	python-numpy
	boost-devel
)
bonusPackages=(
	emacs 
	tcsh
	zsh
	gvim
	gedit
)

for p in ${neededPattern[@]}; do
    sudo zypper -n install -t pattern $p
done

for p in ${neededPackages[@]}; do
    sudo zypper -n install $p
done

for p in ${bonusPackages[@]}; do
    sudo zypper -n install $p
done

#echo
#echo "Patching glxext.h in /usr/include/GL"
#sudo cp $HOME/fastExtendSetup/GLFix/glxext.h /usr/include/GL/.
#echo "		--- Done"

echo
echo "Script Ended"
echo "OpenSUSE setup completed"
echo
echo
