#!/bin/sh
# set DISTRO either to "Ubuntu", "Debian" or "Fedora"
DISTRO="Ubuntu"
LINVERSION="18.04"

# Get Jamulus Release Name with "curl" and "grep"
R=`curl -s https://api.github.com/repos/corrados/jamulus/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")'`
echo "Jamulus Installation Script for $DISTRO $LINVERSION"
echo "Release: $R"

echo "Start Installation $DISTRO $LINVERSION"
echo "(1) Fetch Release $R from GitHub"
wget https://github.com/corrados/jamulus/archive/$R.tar.gz
echo "(2) Extract Source Code for Jamulus Release $R from GitHub"
tar -xvf $R.tar.gz
echo "(3) Delete ${R}.tar.gz from GitHub"

echo "(6) Compile Jamulus $R"
echo "Change to Directory jamulus-$R"
cd "jamulus-$R"

# ls
qmake Jamulus.pro
make clean
    make
    make install
    echo "Compilation DONE"
    cd ..
    echo "(6) Delete the Source Files after Installation"
    rm -R "jamulus-$R"

# prepare package
echo $R > packname.txt
