#!/bin/bash

if $(type bx >/dev/null 2>&1); then
  echo "Bluemix CLI already installed"
else
  echo "Installing Bluemix CLI ..."
  wget https://clis.ng.bluemix.net/download/bluemix-cli/latest/linux64; \
    tar -xvzf linux64

  # Install Bluemix CLI
  Bluemix_CLI/install_bluemix_cli && rm -rf Bluemix_CLI
fi

if $(bx pr >/dev/null 2>&1); then
  echo "ICP CLI already installed"
else
  echo "Installing ICP CLI ..."
  # Download ICP CLI - pr
  wget https://mycluster.icp:8443/api/cli/icp-linux-amd64 --no-check-certificate

  # Install ICP CLI plugin
  bx plugin install icp-linux-amd64 && rm icp-linux-amd64
fi
