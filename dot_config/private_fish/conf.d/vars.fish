## Colemak
set -gx COLEMAK true

## lazygit
set -gx XDG_CONFIG_HOME "$HOME/.config"

# Homebrew
set -gx HOMEBREW_PREFIX "/usr/local";
set -gx HOMEBREW_CELLAR "/usr/local/Cellar";
set -gx HOMEBREW_REPOSITORY "/usr/local/Homebrew";
set -q PATH; or set PATH ''; set -gx PATH "/usr/local/bin" "/usr/local/sbin" $PATH;
set -q MANPATH; or set MANPATH ''; set -gx MANPATH "/usr/local/share/man" $MANPATH;
set -q INFOPATH; or set INFOPATH ''; set -gx INFOPATH "/usr/local/share/info" $INFOPATH;

# Pyenv
set -gx PYENV_ROOT $HOME/.pyenv
set -gx PATH $PYENV_ROOT/bin $PATH

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

## fzf
set -gx FZF_DEFAULT_OPTS "--ansi"
