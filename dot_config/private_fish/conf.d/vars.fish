## Colemak
set -gx COLEMAK true

## lazygit
set -gx XDG_CONFIG_HOME "$HOME/.config"

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Pyenv
set -gx PYENV_ROOT $HOME/.pyenv
set -gx PATH $PYENV_ROOT/bin $PATH

# Pipx / Poetry
fish_add_path $HOME/.local/bin

# Pip
set -gx PIP_REQUIRE_VIRTUALENV true

# Go
fish_add_path $HOME/go/bin

# GPG TTY
set -gx GPG_TTY $(tty)

# DevPi
set PIP_INDEX_URL http://localhost:4040/root/pypi/+simple/

# McFly
# set -gx MCFLY_RESULTS_SORT LAST_RUN
set -gx MCFLY_RESULTS 40

## rustup
fish_add_path $HOME/.cargo/bin

## fzf
set -gx FZF_DEFAULT_OPTS --ansi

## OP
set -gx OP_ACCOUNT LV4XK7GW6VGCBJHMIYAG26GFT4
