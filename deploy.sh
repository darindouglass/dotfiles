#!/bin/bash

echo "Creating dotfile directory"
if [ ! -d ~/.dotfiles ]; then
    mkdir ~/.dotfiles
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "Moving files into place"
for file in $DIR/.*;
do
    [[ -d $file ]] && continue

    echo "$file"
    cp $file ~/
done

for file in $DIR/dotfiles/*;
do
    [[ -d $file ]] && continue

    echo "$file"
    cp $file ~/.dotfiles/
done

. ~/.bashrc
