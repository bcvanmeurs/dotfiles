alias cls=clear
alias azal="az account list -o table"
alias azas="az account set --subscription "
alias kx="kubectx"
alias kn="kubens"
alias g-='git checkout -'
# alias k="kubectl"
alias tp="terraform plan -out tfplan"
alias ta="terraform apply"
alias kcurl="kubectl run --rm curl --image=radial/busyboxplus:curl -i --tty"
alias kdeb="kubectl run --rm debian --image=debian:latest -i --tty"
alias kev="k get ev --sort-by='.lastTimestamp'"
alias kevw="k get ev --sort-by='.lastTimestamp' --field-selector type=Warning"
alias dc=docker-compose

alias ghprv="gh pr view -w"
function ghb() {
  gh browse --branch $(git branch --show-current)
}

function dockerrmi() {
  docker rmi $(docker images -f 'dangling=true' -q)
}

function find1() {
  find . -maxdepth 1 -name "*$@*"
}

## connect to ssh quickly in new terminal (autocomplete doesn't work yet)
sb() {
  TERM_TITLE=$1
  HOST=$1
  shift
  echo -en "\033]0;${TERM_TITLE}\007"
  ssh -t "${HOST}" "$@" tmux -CC new -As0
}

_sb() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  COMPREPLY=( $(compgen -W "$(awk '/^Host +az/ {print $2}' ~/.ssh/config)" -- $cur) )
}

complete -F _sb sb


## GPG

secret () {
        output="${1}".$(date +%y%m%d).enc
        gpg --encrypt --armor --output ${output} -r 0x7DFB3B93C5B98C91 "${1}" && echo "${1} -> ${output}"
}

reveal () {
        output=$(echo "${1}" | rev | cut -c12- | rev)
        gpg --decrypt --output ${output} "${1}" && echo "${1} -> ${output}"
}

sign () {
        output="${1}".$(date +%y%m%d).sign
        gpg --armor --output ${output} --clearsign ${1}  && echo "${1} -> ${output}"
}

## Chezmoi
alias dotfiles="cd ~/.local/share/chezmoi"
alias dotconfig="cd ~/.config/chezmoi"
