# Homebrew
fish_add_path /usr/local/sbin

# Pyenv
set -gx PYENV_ROOT $HOME/.pyenv
set -gx PATH $PYENV_ROOT/bin $PATH

pyenv init - | source
pyenv virtualenv-init - | source

# Pipx / Poetry
fish_add_path $HOME/.local/bin

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

