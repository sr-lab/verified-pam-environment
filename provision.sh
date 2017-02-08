#!/bin/bash 

# Standard stuff for fresh system.
sudo apt-get update -y
sudo apt-get upgrade -y

# We need this to add the OPAM repository.
sudo apt-get install -y software-properties-common python-software-properties

# Now add the OCaml/OPAM repository.
sudo add-apt-repository -y ppa:avsm/ppa
sudo apt-get update -y

# We need m4 before the rest of the OCaml stuff.
sudo apt-get install m4

# We need these to build Coq.
sudo apt-get install -y ocaml ocaml-native-compilers camlp5 liblablgtk2-ocaml-dev liblablgtksourceview2-ocaml-dev libgtk2.0-dev

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

# Install Haskell compiler.
sudo apt-get install ghc

# Install PAM sources.
sudo apt-get install libpam0g-dev
