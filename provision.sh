#!/bin/bash 

# Adjust to fastest mirrors.
sudo sed -i -e 's/http:\/\/us.archive/mirror:\/\/mirrors/' -e 's/\/ubuntu\//\/mirrors.txt/' /etc/apt/sources.list

# Standard stuff for fresh system.
sudo apt-get update -y
sudo apt-get upgrade -y -qq

# We need this to add the OPAM repository.
sudo apt-get install -y software-properties-common python-software-properties

# We need m4 before the rest of the OCaml stuff.
sudo apt-get install -y m4

# Now add the OCaml/OPAM repository.
sudo add-apt-repository -y ppa:avsm/ppa
sudo apt-get update -y

# We need these to build Coq.
sudo apt-get install -y ocaml ocaml-native-compilers camlp5 liblablgtk2-ocaml-dev liblablgtksourceview2-ocaml-dev libgtk2.0-dev

# Install OPAM.
sudo apt-get install -y opam

# Now initialise OPAM for this user.
opam init -a -y

# Now install ocamlfind.
opam install ocamlfind -y

# Go home.
cd ~

# Download and unzip Coq sources.
wget https://coq.inria.fr/distrib/V8.6/files/coq-8.6.tar.gz
tar -xvzf coq-8.6.tar.gz

# Change directory.
cd coq-8.6

# Global install.
./configure -prefix /usr/local
make
sudo make install

# Clean up.
cd ..
rm coq-8.6.tar.gz
rm -rf coq-8.6

# Install Haskell compiler.
sudo apt-get install ghc -y

# Install PAM sources.
sudo apt-get install libpam0g-dev -y
