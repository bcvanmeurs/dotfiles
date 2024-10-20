brew:
    chezmoi apply ~/Brewfile
    brew bundle install --no-upgrade --file=~/Brewfile
    brew bundle cleanup --file=~/Brewfile

brew-clean:
    chezmoi apply ~/Brewfile
    brew bundle cleanup --force --file=~/Brewfile
    brew autoremove
    brew cleanup

brew-upgrade:
    if [ ! -f "~/Library/Application Support/pueue/pueue.pid" ]; then \
        pueued -d; \
    fi
    pueue add 'brew update && brew upgrade && curl -sd "Update brew successful" ntfy.local.vanmeurs.dev/test || { curl -sd "Update brew failed" ntfy.local.vanmeurs.dev/test; exit 1; }'

just-fmt:
    just --fmt --unstable
