alias rep = cd (fd -d 1 -t directory -c always . ~/repos/ | fzf --ansi )
alias rev = vim (fd -d 1 -t directory -c always . ~/repos/ | fzf --ansi )
def lsg [] { ls | sort-by type name -i | grid -c | str trim }
