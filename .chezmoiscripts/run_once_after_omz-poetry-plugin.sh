#!/bin/sh
if  [ "$(ls -A ~/.oh-my-zsh/custom/plugins/poetry)" ]; then
    echo "poetry plugin already installed"
else
(
    mkdir ~/.oh-my-zsh/custom/plugins/poetry
    poetry completions zsh > ~/.oh-my-zsh/custom/plugins/poetry/_poetry
)
fi
