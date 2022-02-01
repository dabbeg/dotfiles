# David's Dotfiles
This repository contains all important dotfiles that I keep track of and a handy way of keeping track of them from multiple computers.

For anyone who is reading this: This is more of a documentation of linux programs and configuration I have to remember than a guide to use my dotfiles.

## Install
Clone the repository and run the install script:

`./install.sh`

## How to manage what dotfiles are used
Simply open the 'install/link.sh' script and add the filename in the appropriate file list.

### Internet
Use netctl to configure and manage network connections.
To auto connect at boot use netctl-ifplugd for ethernet and netctl-auto for wifi.

To connect to home wifi networks its possible to connect with wifi-menu. It creates a profile which can be later used for netctl.
For more complex networks a custom profile must be created, see the netctl directory.

#### Static ip at work
DHCP servers distribute ip addresses to the computers that want to connect to the network.
At work we have to have static ip addresses because it is necessary to give ip addresses access to certain environments.
To be able to get this ip address the computer needs to authenticate itself with a Client ID.
They use the hardware address of the interface for a Client ID.

The problem is that the DHCP client on linux uses by default a duid instead of the mac address, so in order for the DHCP client to use the mac address do the following:

##### Arch
Edit the '/etc/dhcpcd.conf' file and uncomment 'clientid' and comment out 'duid'.
