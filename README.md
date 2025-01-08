# Bram's dotfiles

## Quickstart

Install nix with the determinate systems installer:

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
  sh -s -- install
```

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init apply bcvanmeurs
```

This will download the dotfiles to `~/.local/share/chezmoi`,
as we need the nix-darwin flakes to install the required software.

Install all software and packages:

```bash
nix run nix-darwin -- switch --flake ~/.local/share/chezmoi/dot_config/nix-darwin
```

### Post install steps

- Allow the 1Password cli functionality from the UI.
- Apply chezmoi

  ```bash
  chezmoi status # check if everything works
  chezmoi apply
  ```

- Change your default shell

  ```bash
  chsh -s $(which fish)
  ```

- Set remote to be through SSH

  ```fish
  git remote set-url origin git@github.com:bcvanmeurs/dotfiles.git
  ```

- Import GPG key

  ```fish
  gpg --import ~/.gnupg/gpg-github-0x7DFB3B93C5B98C91-2024-12-03.asc
  gpg --edit-key 0x7DFB3B93C5B98C91
  trust
  quit
  ```

- In tmux run `prefix + I` to install [tpm](https://github.com/tmux-plugins/tpm) packages.

## Choices made

- Using Age and YubiKeys for encryption ([age-plugin-yubikey](https://github.com/str4d/age-plugin-yubikey))
- SSH keys on YubiKeys with secret part in 1Password
- Using Nix for packages
- Using Brew for casks as these seem better maintained

## Todo

- Headless install on linux
- Encryption dependencies
- Install dependencies
- Inspiration:
  - [felipecrs/dotfiles](https://github.com/felipecrs/dotfiles)
    - [.chezmoiexternal](https://github.com/felipecrs/dotfiles/blob/master/home/.chezmoiexternal.yaml)
    - [.gitconfig](https://github.com/felipecrs/dotfiles/blob/master/home/dot_gitconfig.tmpl)
  - [batistein/dotfiles](https://github.com/batistein/dotfiles)
    - [aliases](https://github.com/batistein/dotfiles/blob/master/dot_zsh/alias.zsh)
  - [twpayne/dotfiles](https://github.com/twpayne/dotfiles)

## Encryption

### Encryption with age

1. Follow this to create a key pair: <https://www.chezmoi.io/user-guide/frequently-asked-questions/encryption/>
2. Encrypt a yaml file in some place (in my example it is in data).
3. Use Go templating syntax to read and decrypt the file, for example:

   ```bash
   {{- $work := include "data/work.yaml.age" | decrypt | fromYaml -}}
   export PIP_EXTRA_INDEX_URL={{ $work.pip_extra_index_url }}
   ```

### Encryption with 1Password

```yaml
{{ onepasswordRead "op://development/id_sk_nano/id_sk_nano.pub" }}
```

## Cheatsheet

- `chezmoi init` recreate config
- `chezmoi --refresh-externals` update externals

### Using chezmoi across multiple machines

- `chezmoi init $GITHUB_USERNAME` clones your dotfiles from GitHub into the source directory.
- `chezmoi init --apply $GITHUB_USERNAME` clones your dotfiles from GitHub into the source directory and runs `chezmoi apply`.
- `chezmoi update` pulls the latest changes from your remote repo and runs `chezmoi apply`.

### Working with templates

- `chezmoi data` prints the available template data.
- `chezmoi add --template $FILE` adds `$FILE` as a template.
- `chezmoi chattr +template $FILE` makes an existing file a template.
- `chezmoi cat $FILE` prints the target contents of `$FILE`, without changing `$FILE`.
- `chezmoi execute-template` is useful for testing and debugging templates.

### Working with scripts

- `chezmoi state delete-bucket --bucket=scriptState` to clear the state of run _once_ scripts.

### Daily commands

- `chezmoi add $FILE` adds `$FILE` from your home directory to the source directory.
- `chezmoi edit $FILE` opens your editor with the file in the source directory that corresponds to `$FILE`.
- `chezmoi status` gives a quick summary of what files would change if you ran `chezmoi apply`.
- `chezmoi diff` shows the changes that `chezmoi apply` would make to your home directory.
- `chezmoi apply` updates your dotfiles from the source directory.
- `chezmoi edit --apply $FILE` is like `chezmoi edit $FILE` but also runs `chezmoi apply $FILE` afterwards.
- `chezmoi cd` opens a subshell in the source directory.
