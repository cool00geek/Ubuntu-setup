# Ubuntu-setup

A set of setup scripts for the Ubuntu operating system

## Supported Operating systems

Run the script for the desired OS. We support the following

- Ubuntu 16.04
- KDE Neon User edition (2018 April)
- Ubuntu 17.10
- Kubuntu 18.04 Minimal install

## Running the script

The Ansible playbook can be run by the following command:

`sudo ansible-playbook Ubuntu.yml --extra-vars "user=YOUR_USERNAME_GOES_HERE"`
where `YOUR_USERNAME_GOES_HERE` is your local username.

Make sure Ansible is installed: `sudo apt-get install ansible`

## What's not installed

- [Arc OSX themes](https://www.gnome-look.org/p/1013690/)
- [DisplayLink drivers](http://www.displaylink.com/downloads/file?id=993)
- [VMware workstation](https://www.vmware.com/go/tryworkstation-linux-64)
- Brother printer driver - Found in ~/Downloads