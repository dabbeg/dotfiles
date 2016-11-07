# David's Dotfiles
This repository contains all important dotfiles that I keep track of and a handy way of keeping track of them from multiple computers.

For anyone who is reading this: This is more of a documentation of linux programs and configuration I have to remember than a guide to use my dotfiles.

## Install
Clone the repository and run the install script:

`./install.sh`

## How to manage what dotfiles are used
Simply open the 'install/link.sh' script and add the filename in the appropriate file list.


### Remote Desktop for windows
Use FreeRDP from https://github.com/FreeRDP/FreeRDP <br/>
But to be able to switch workspaces in i3 it needs to be compiled from the source with a small addition to the code.

1. Clone the repo <br/>
`git clone https://github.com/FreeRDP/FreeRDP.git` <br/>
`cd FreeRDP`

2. Add this addtion to the xf_keyboard_handle_special_keys function in the client/X11/xf_keyboard.c file <br/>
    ```c
    if (mod.Alt)
    {
        if (!xfc->fullscreen)
        {
            XUngrabKeyboard(xfc->display, CurrentTime);
            return TRUE;
        }
        else
        {
            xf_toggle_control(xfc);
            XUngrabKeyboard(xfc->display, CurrentTime);
            return TRUE;
        }
    }
    ```

3. Configure RDP for compilation <br/>
`cmake -DCMAKE_BUILD_TYPE=Debug -DWITH_SSE2=ON -DWITH_CUPS=on -DWITH_WAYLAND=off -DWITH_PULSE=on -DCMAKE_INSTALL_PREFIX:PATH=/opt/remmina_devel/freerdp .`

4. Comile and install, the program will be installed under /opt/remmina_devel <br/>
`make && make install`

5. Link the executable to /usr/local/bin <br/>
`ln -s /opt/remmina_devel/freerdp/bin/xfreerdp /usr/local/bin/`

6. Connect to the machine, scaling is used because my machine has hidpi screen <br/>
`xfreerdp +clipboard /sound:rate:44100,channel:2 /v:ip-address /u:username /p:password /scale-desktop:150 /scale-device:100 /f`

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

The problem is that the DHCP client on linux uses by default a duid instead of the mac address, so in order for the DHCP client to use the mac address we need to edit the '/etc/dhcpcd.conf' file and uncomment 'clientid' and comment out 'duid'.

