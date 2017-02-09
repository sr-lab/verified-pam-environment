# Verified PAM Environment
Vagrantfile and provisioning scripts to create an environment for developing verified PAM modules.

## Prerequisites
You'll need [Oracle VM VirtualBox](https://www.virtualbox.org/wiki/Downloads) installed as well as [Vagrant](https://www.vagrantup.com/downloads.html).

## Setup
Like any Vagrant box, run:

```bash
vagrant up
```

It's recommended that Windows users use the [Cygwin](https://www.cygwin.com/) terminal because that comes with an SSH agent. From there, use:

```bash
vagrant ssh
```

To access the box over SSH.

## Details
The box is running Ubuntu "Xenial" 16.04 LTS with:

* OCaml, OPAM and a bunch of associated libraries/tools
* The Glasgow Haskell Compiler (GHC)
* Coq 8.6 (built from source)
* Development files for PAM (`libpam0g-dev`)
