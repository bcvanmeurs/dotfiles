{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  # home.username = "bram"; # set as extraSpecialArgs in flake.nix
  # home.homeDirectory = "/Users/bram";
  xdg.enable = true;

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    ## Essentials
    age
    age-plugin-yubikey
    delta # can be part of git program
    nerd-fonts.fira-code
    git-lfs
    gnused
    gojq
    kubectl
    kubectx
    minikube
    pre-commit
    ripgrep
    ripgrep-all
    rm-improved
    tree
    tlrc # tldr client in rust
    uv
    wget

    dive
    dust
    fx
    # httpie
    lazydocker
    parallel
    prettierd
    procps # watch
    pueue
    zstd

    # lf
    # ranger
    # mprocs

    ## applications
    alt-tab
    monitorcontrol
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
    };
    bat.enable = true;
    broot = {
      enable = true;
      enableFishIntegration = true;
    };
    direnv = {
      enable = true;
      enableFishIntegration = true;
    };
    eza = {
      enable = true;
      enableFishIntegration = true;
    };
    fd.enable = true;
    fzf = {
      enable = true;
      enableFishIntegration = true;
    };
    # gpg = { # needs additional config
    #   enable = true;
    # };
    htop.enable = true;
    lazygit.enable = true;
    mise = {
      enable = true;
      enableFishIntegration = true;
    };
    pyenv = {
      enable = true;
      enableFishIntegration = true;
    };
    starship = {
      enable = true;
      enableFishIntegration = true;
    };
    wezterm.enable = true;
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
  };

  #services.gpg-agent = {
  #  enable = true;
  #  defaultCacheTtl = 1800;
  #  enableSshSupport = true;
  #};
}