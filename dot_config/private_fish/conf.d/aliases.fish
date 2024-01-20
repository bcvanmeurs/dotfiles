## System
alias cls="clear"
alias vim="nvim"

alias v="fd --type file --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim"
alias d="fd --type file --hidden --exclude .git . ~/.local/share/chezmoi | fzf-tmux -p --reverse | xargs nvim"

## Git

alias g="git"
alias gcm="git checkout main"
alias gst="git status"
alias gaa="git add -A"
alias gd="git diff"
alias gds="git diff --staged"
alias gp="git push"
alias gpf="git push --force"
alias gcb="git checkout -b"
alias gco="git checkout"
alias gcmsg="git commit -m"
alias gl="git pull"

## Repos
# alias rep="cd ( fd -d 1 -t directory -c always . ~/repos/ | fzf --ansi )"
function rep
    cd (fd -d 1 -t directory -c always . ~/repos/ | fzf --ansi --height 40% --reverse --query "$argv")
end

alias rev="nvim ( fd -d 1 -t directory -c always . ~/repos/ | fzf --ansi )"
alias lg="lazygit"

## exa
set -gx EXA_GRID_ROWS 10
alias ls="COLUMNS=80 exa --icons"
alias ll="exa --long --header --grid --git --no-permissions --no-user --icons"
alias tree="ll -T --git-ignore"
alias la="ls -a"
alias lla="ll -a"

## Azure
alias azal="az account list -o table"
alias azas="az account set --subscription"

## Chezmoi
alias dotfiles="cd ~/.local/share/chezmoi"
alias dotconfig="cd ~/.config/chezmoi"

## Git / Github
alias g-='git checkout -'
alias ghprv="gh pr view -w"

## Docker
alias dc="docker-compose"

## Kubernetes
alias k="kubectl"
alias kn="kubens"
alias kx="kubectx"

alias kcurl="kubectl run --rm curl --image=radial/busyboxplus:curl -i --tty"
alias kdeb="kubectl run --rm debian --image=debian:latest -i --tty"
alias kev="k get ev --sort-by='.lastTimestamp'"
alias kevw="k get ev --sort-by='.lastTimestamp' --field-selector type=Warning"

## Terraform
alias tp="terraform plan -out tfplan"
alias ta="terraform apply"
