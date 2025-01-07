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
    if [ ! -f "$HOME/Library/Application Support/pueue/pueue.pid" ]; then \
      pueued -d; \
    fi
    pueue add 'brew update && brew upgrade && curl -sd "Update brew successful" ntfy.local.vanmeurs.dev/test || { curl -sd "Update brew failed" ntfy.local.vanmeurs.dev/test; exit 1; }'

rebuild:
    darwin-rebuild switch --flake ~/.local/share/chezmoi/dot_config/nix-darwin

update:
    nix flake update --flake ~/.local/share/chezmoi/dot_config/nix-darwin
    just rebuild

just-fmt:
    just --fmt --unstable
