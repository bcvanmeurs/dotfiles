## System
alias cls="clear"
alias vim="nvim"
alias lvim="NVIM_APPNAME=nvim-lazyvim nvim"

alias v="fd --type file --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim"
alias d="fd --type file --hidden --exclude .git . ~/.local/share/chezmoi | fzf-tmux -p --reverse | xargs nvim"
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

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

## Chezmoi
alias chs="chezmoi status --exclude=templates,encrypted"
alias chd="chezmoi diff --exclude=templates,encrypted"
alias cha="chezmoi apply --exclude=templates,encrypted"

## Repos
# alias rep="cd ( fd -d 1 -t directory -c always . ~/repos/ | fzf --ansi )"
function rep
    cd (fd -d 1 -t directory -c always . ~/repos/ | fzf --ansi --height 40% --reverse --query "$argv")
end

function cloneRepo
    set REPO (cat ~/adarga-ltd-repos.txt | fzf --layout reverse --border --height ~40% --tmux 80%)
    set REPO_DIR "$HOME/repos/$REPO"

    if test ! -d "$REPO_DIR"
        git clone "org-25746375@github.com:Adarga-Ltd/$REPO.git" "$REPO_DIR"
    end

    cd "$REPO_DIR"
end

alias clone_repo=cloneRepo
alias update_repos="gh repo list adarga-ltd --json name -L 500 | jq -r 'sort_by(.name | ascii_downcase).[].name' > ~/adarga-ltd-repos.txt"

alias rev="nvim ( fd -d 1 -t directory -c always . ~/repos/ | fzf --ansi )"
alias lg="lazygit"

## EZA
set -gx EZA_GRID_ROWS 10
alias ls="COLUMNS=80 eza --icons"
alias ll="eza --long --header --grid --git --no-permissions --no-user --icons"
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

## Gojq
alias jq="gojq"

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

## AWS
alias aws-login='AZURE_DEFAULT_ROLE_ARN=$(op --account=X63GM56VTVDSRF2TUGZB345RSM read "op://Employee/Adarga/role") \
	aws-azure-login -p AdargaAWS'

alias docker-login='aws --profile adarga-labs ecr get-login-password --region eu-west-2 | docker login --username AWS --password-stdin 382855879375.dkr.ecr.eu-west-2.amazonaws.com'
