if [ -d ~/.aliases ]; then
    for file in ~/.aliases/*;
    do
        . $file
    done
fi
