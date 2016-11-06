# David's Dotfiles
This repository contains all important dotfiles that I keep track of and a handy way of keeping track of them from multiple computers.

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
```
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
