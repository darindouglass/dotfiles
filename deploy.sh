#!/bin/bash

echo "Creating alias directory"
if [ ! -d ~/.aliases ]; then
    mkdir ~/.aliases
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "Moving files into place..."

shopt -s dotglob
for file in $DIR/configs/*;
do
    [[ -d $file ]] && continue

    echo "$file"
    cp $file ~/
done

for file in $DIR/aliases/*;
do
    [[ -d $file ]] && continue

    echo "$file"
    cp $file ~/.aliases/
done
shopt -u dotglob

echo "Moving emacs config into place..."
EMACS_DIR=~/.emacs.d
if [ ! -d $EMACS_DIR ]; then
    mkdir $EMACS_DIR
fi

cp -rf $DIR/emacs $EMACS_DIR

. ~/.bashrc
