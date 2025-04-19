if status is-interactive
    # Commands to run in interactive sessions can go here
    zoxide init fish | source
    starship init fish | source
    # mcfly init fish | source
    #set -gx PATH $PATH $HOME/.krew/bin
end

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/bram/.lmstudio/bin

# vscode
string match -q "$TERM_PROGRAM" vscode; and . (code --locate-shell-integration-path fish)
