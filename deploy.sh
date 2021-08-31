#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "Moving files into place..."

profile=~/.bash_profile
if [[ "$SHELL" != "/bin/bash" ]]; then
  profile=~/.zshrc
fi

shopt -s dotglob
for file in $DIR/configs/*;
do
    [[ -d $file ]] && continue

    echo "$file"
    cp $file ~/$(basename $file)
done

for file in $DIR/files/*;
do
    echo "Installing $(basename $file)"
    cp $file ~/.$(basename $file)
    echo "" >> $profile
    echo "source ~/.$(basename $file)" >> $profile
done
shopt -u dotglob

echo "Moving emacs config into place..."
EMACS_DIR=~/.emacs.d
if [ ! -d $EMACS_DIR ]; then
    mkdir $EMACS_DIR
fi

cp -rf $DIR/emacs/* $EMACS_DIR/.
