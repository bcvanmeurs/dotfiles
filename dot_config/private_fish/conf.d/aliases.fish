## System
alias cls="clear"
alias vim="nvim"

alias v="fd --type file --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim"
alias d="fd --type file --hidden --exclude .git . ~/.local/share/chezmoi | fzf-tmux -p --reverse | xargs nvim"

## Repos
alias rep="fd -d 1 -t directory -c always . ~/repos/ | fzf --ansi | xargs cd"
alias rev="fd -d 1 -t directory -c always . ~/repos/ | fzf --ansi | xargs vim"
alias lg="lazygit"

## exa
set -gx EXA_GRID_ROWS 7
alias ls="COLUMNS=80 exa --icons"
alias ll="exa --long --header --grid --git --no-permissions --no-user --icons"
alias lt="ll -T --git-ignore"

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
