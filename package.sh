#!/usr/bin/env bash

export USER=newuser
cd /opt/; sleep 5s; export USER=newuser;

R=$(<./packname.txt)
version_num=$(echo $R | sed 's/r\([0-9]\)*_\([0-9]\)*_\([0-9]*\)*.*/\1.\2.\3/')

cp $R.tar.gz Jamulus_${version_num}.orig.tar.gz
bzr whoami "Francisco Fuentes <ffuentes@emergya.com>"

./expect_bzr.sh ${version_num} Jamulus_${version_num}.orig.tar.gz
bzr add jamulus/debian/source/format
cd jamulus/; bzr commit -m "Initial commit of Debian packaging."
bzr builddeb -- -us -uc; cd ..

# delete upstream tarball
rm -f $R.tar.gz
rm -R -f Jamulus*
mkdir build
mv jamulus*.deb build/
