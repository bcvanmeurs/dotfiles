## System
alias cls="clear"

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

