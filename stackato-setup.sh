#!/bin/bash
#echo "This scripts does Stackato setup related to filesystem."
FS=$HOME

if [ -e $FS/wp-salt.php ]
  then
    echo "Configuration file exists."
else
    echo "Configuration file not found. Setting up..."

    # Add a bit of salt (secure)
    echo "<?php" > $FS/wp-salt.php
    curl -s https://api.wordpress.org/secret-key/1.1/salt/ >> $FS/wp-salt.php
    echo "?>" >> $FS/wp-salt.php

    # create files in the shared filesystem
    touch $FS/.htaccess

    # create folders in the shared filesystem 
    mkdir -p $FS/wp-content
fi
