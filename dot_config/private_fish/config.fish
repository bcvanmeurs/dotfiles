if status is-interactive
    # Commands to run in interactive sessions can go here
    zoxide init fish | source
    starship init fish | source
    # mcfly init fish | source
    pyenv init - | source
    # pyenv virtualenv-init - | source
    direnv hook fish | source
    /opt/homebrew/opt/mise/bin/mise activate fish | source
end
