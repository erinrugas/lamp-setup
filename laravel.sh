#! /bin/bash

echo "Do you want to install laravel? [Y,n]"

read answer

filename='/home/eriinr/.bashrc'

if [[ $answer == "Y" || $answer == "y" || $answer == "yes" ]]; then
    #add composer global
    composer global require laravel/installer

    #export composer file
    echo 'export PATH="$HOME/.config/composer/vendor/bin:$PATH"' >> $filename
    #source .bashrc
    source ~/.bashrc 
else
    echo "Abort installing laravel."
fi
