let-env PATH = ($env.PATH | split row (char esep) | prepend '~/.pyenv/shims/')
let-env PYENV-SHELL = "nu"

^pyenv rehash # err>/dev/null

def-env pyenv [command: string, ...args] {
    match $command {
        "activate" | "deactivate" | "rehash" | "shell" => {
            run (^pyenv "sh-$command" $args) | psub;
        }
        _ => {
            ^pyenv $command $args;
        }
    }
}
