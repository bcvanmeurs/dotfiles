if status is-interactive
    # Commands to run in interactive sessions can go here
    zoxide init fish | source
    starship init fish | source
    # mcfly init fish | source
    pyenv init - | source
    # pyenv virtualenv-init - | source
    direnv hook fish | source
    /opt/homebrew/opt/mise/bin/mise activate fish | source
    # set -q KREW_ROOT; and set -gx PATH $PATH $KREW_ROOT/.krew/bin; or set -gx PATH $PATH $HOME/.krew/bin
    set -gx PATH $PATH $HOME/.krew/bin
end
