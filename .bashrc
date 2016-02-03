if [ -d ~/.dotfiles ]; then
    for file in ~/.dotfiles;
    do
        . $file
    done
fi
