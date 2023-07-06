# Homebrew
let-env PATH = ($env.PATH | split row (char esep) | append '/usr/local/bin/')
let-env PATH = ($env.PATH | split row (char esep) | append '/usr/local/sbin/')

let-env HOMEBREW_PREFIX = "/usr/local/"
let-env HOMEBREW_CELLAR = "/usr/local/Cellar/"
let-env HOMEBREW_REPOSITORY = "/usr/local/Homebrew/"
let-env MANPATH = ["/usr/local/share/man/"]
let-env MANPATH = ["/usr/local/share/info/"]
