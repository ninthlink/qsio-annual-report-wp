#!/bin/bash
#echo "This scripts does Stackato setup related to filesystem."
FS=$STACKATO_FILESYSTEM

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

echo "Migrating data to shared filesystem..."
cp -r www/wp-content/* $FS/wp-content

echo "Symlink to files in shared filesystem..."
rm -f www/.htaccess www/wp-salt.php
ln -s $FS/.htaccess www/.htaccess
ln -s $FS/wp-salt.php www/wp-salt.php

echo "Symlink to folders in shared filesystem..."
rm -fr www/wp-content
ln -s $FS/wp-content www/wp-content

echo "All Done!"

