#!/bin/bash 

# Adjust to closest mirrors.
sudo sed -i -e 's/http:\/\/us.archive/mirror:\/\/mirrors/' -e 's/\/ubuntu\//\/mirrors.txt/' /etc/apt/sources.list

# Standard stuff for fresh system.
sudo apt-get update -y
sudo apt-get upgrade -y -qq # The quiet flag suppresses annoying GRUB interactive.

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

# Install Haskell compiler.
sudo apt-get install ghc -y

# Install PAM sources.
sudo apt-get install libpam0g-dev -y

# Install Cracklib (the PAM module).
sudo apt-get install libpam-cracklib -y

# Install Libcrack (the password library).
sudo apt-get install libcrack2-dev -y
