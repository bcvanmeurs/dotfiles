brew:
    chezmoi apply ~/Brewfile
    brew bundle install --no-upgrade --file=~/Brewfile
    brew bundle cleanup --file=~/Brewfile

brew-clean:
    brew bundle cleanup --force --file=~/Brewfile
    brew autoremove
    brew cleanup

just-fmt:
    just --fmt --unstable
