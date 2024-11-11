#!/bin/bash
# Author: Arthur Cadore M. Barcella
# Github: arthurcadore

# Script to install typst libraries on ubuntu 22.04:

# install base packets for typst
sudo apt install -y curl build-essential pkg-config libssl-dev

# add cargo library package manager: 
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env
cargo --version 

# install typst using cargo 
cargo install --locked typst-cli

# Note once tyspt was installed: 
#       Use the "typst-lsp" (nvarner.typst-lsp) extension of github to compile .typ files; 
#       Use the "PDF Viewer" (mathematic.vscode-pdf)" extension to .pdf files view; 