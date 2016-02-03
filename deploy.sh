#!/bin/bash

echo "Creating dotfile directory"
if [ ! -d ~/.dotfiles ]; then
    mkdir ~/.dotfiles
fi

echo "Moving files into place"
for file in .*;
do
    [[ -d $file ]] && continue

    echo "$file"
    cp $file ~/
done

for file in ./dotfiles/*;
do
    [[ -d $file ]] && continue

    echo "$file"
    cp $file ~/.dotfiles/
done

. ~/.bashrc
