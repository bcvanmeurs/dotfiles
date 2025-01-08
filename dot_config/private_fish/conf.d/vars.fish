## Colemak
set -gx COLEMAK true

## Set nvim as default editor
set -gx EDITOR nvim
set -gx VISUAL nvim

## SSH Yubikey
set -gx SSH_AUTH_SOCK "~/.ssh/agent"

## lazygit
set -gx XDG_CONFIG_HOME "$HOME/.config"

# Pip
set -gx PIP_REQUIRE_VIRTUALENV true

# pipx
set PATH $PATH /Users/bram.vanmeurs/.local/bin

# GPG TTY
set -gx GPG_TTY $(tty)

# DevPi
# set PIP_INDEX_URL http://localhost:4040/root/pypi/+simple/

## fzf
set -gx FZF_DEFAULT_OPTS --ansi

## OP
set -gx OP_ACCOUNT LV4XK7GW6VGCBJHMIYAG26GFT4
