if status is-interactive
    # Commands to run in interactive sessions can go here
    zoxide init fish | source
    starship init fish | source
    # mcfly init fish | source
    #set -gx PATH $PATH $HOME/.krew/bin
end
