#!/bin/bash
node_version=v0.12.7
install_name=node-v0.12.7-linux-x64
if [ ! -e $install_name.tar.gz ]; then
    wget "http://nodejs.org/dist/$node_version/$install_name.tar.gz"
    echo 'Untarring'
    tar xf $install_name.tar.gz
fi
NODE_12_INSTALL_DIR=`pwd`/$install_name/bin
PATH=$NODE_12_INSTALL_DIR:$PATH
node -v