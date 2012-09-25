#!/bin/bash
# Deploy ZF2 sekeleton
# Usage: zf2_skel [Folder]
# @author: Diego Sapriza

INSTALL_DIR="."
if [ $# -gt 0 ];
then
    INSTALL_DIR=$1
fi

#Check if folder exists
if [ ! -d $INSTALL_DIR ];
then
    echo "Folder '$INSTALL_DIR' does not exists."
    exit 1
fi

echo "Deploying Zend Framework 2 in '$INSTALL_DIR'"

cd $INSTALL_DIR
wget -O ZF2SkelApp.tgz https://github.com/zendframework/ZendSkeletonApplication/tarball/master
tar xzf ZF2SkelApp.tgz --strip-components=1
php composer.phar install
rm -f ZF2SkelApp.tgz

echo "Zend Framework 2 Sekeleton deployed in '$INSTALL_DIR'"