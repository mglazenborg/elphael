#!/bin/bash

sudo cp -r $ELPHAEL_PATH/default/plymouth /usr/share/plymouth/themes/connect/
sudo plymouth-set-default-theme connect
