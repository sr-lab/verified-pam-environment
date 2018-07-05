# Verified PAM Environment
Vagrantfile and provisioning scripts to create an environment for developing verified PAM modules.

## Purpose
This environment can be used to:

* Build [the proof-of-concept project](https://github.com/sr-lab/simple-verified-ffi) for calling verified code from Haskell.
* Build [the verified rewrite](https://github.com/sr-lab/verified-pam-cracklib) of pam_cracklib.
* Build [the original pam_cracklib module](https://github.com/linux-pam/linux-pam) or the version [with the dictionary check disabled](https://github.com/sr-lab/pam-cracklib-nodict).

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
* PAM Cracklib, which doesn't come with Ubuntu Xenial out-of-the-box (`libpam-cracklib`)
* Libcrack, which PAM Cracklib depends on (`libcrack2-dev`)

*Note: No desktop/window system/GUI is installed on this box.*
