source ./aliases.nu
source ./starship.nu
source ./atuin.nu
source ./pyenv.nu

let fish_completer = {|spans|
    fish --command $'complete "--do-complete=($spans | str join " ")"'
    | $"value(char tab)description(char newline)" + $in
    | from tsv --flexible --no-infer
}

$env.config.completions.external = {
    enable: true
    max_results: 100
    completer: $fish_completer
}
