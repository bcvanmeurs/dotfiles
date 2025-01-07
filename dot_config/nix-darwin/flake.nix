{
  description = "Bram's Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # nix-darwin
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    # home-manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # nix-homebrew
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      home-manager,
      nix-homebrew,
    }:
    let
      configuration =
        { pkgs, ... }:
        {
          # List packages installed in system profile. To search by name, run:
          # $ nix-env -qaP | grep wget
          environment.systemPackages = [
            pkgs.vim
            pkgs.neovim
            pkgs.nixfmt-rfc-style
            pkgs.chezmoi
            pkgs.openssh # for yubikey
            pkgs.gnupg
            pkgs.pinentry_mac
            pkgs.age
            pkgs.age-plugin-yubikey
            pkgs._1password-cli
            pkgs.tmux
            pkgs.pam-reattach
          ];
          # services = {
          #   aerospace.enable = true; # need a way to parse config
          # };
          # users.users.${userName} = {
          #   name = userName;
          #   home = "/Users/${userName}"; # https://github.com/nix-community/home-manager/issues/6036
          #   shell = pkgs.fish;
          # };
          homebrew = {
            enable = true;
            brews = [ ];
            casks = [
              "firefox"
              "ghostty"
              "monitorcontrol"
              "wezterm"
            ];
            onActivation.cleanup = "zap";
          };

          nixpkgs.config.allowUnfree = true;

          # Auto upgrade nix package and the daemon service.
          services.nix-daemon.enable = true;
          # nix.package = pkgs.nix;

          # Necessary for using flakes on this system.
          nix.settings.experimental-features = "nix-command flakes";

          # Enable alternative shell support in nix-darwin.
          environment.shells = [ pkgs.fish ];
          # programs.zsh.enable = true;
          programs.fish.enable = true;

          # Set Git commit hash for darwin-version.
          system.configurationRevision = self.rev or self.dirtyRev or null;

          # Used for backwards compatibility, please read the changelog before changing.
          # $ darwin-rebuild changelog
          system.stateVersion = 5;

          # The platform the configuration will be used on.
          nixpkgs.hostPlatform = "aarch64-darwin";

          # System config
          # security.pam.enableSudoTouchIdAuth = true;
          # https://write.rog.gr/writing/using-touchid-with-tmux/
          environment.etc."pam.d/sudo_local".text = ''
            # Managed by Nix Darwin
            auth       optional       ${pkgs.pam-reattach}/lib/pam/pam_reattach.so ignore_ssh
            auth       sufficient     pam_tid.so
          '';
          system.defaults = {
            # Don’t rearrange spaces based on the most recent use
            finder.AppleShowAllExtensions = true;
            # List view: "Nlsv"
            finder.FXPreferredViewStyle = "Nlsv";
            finder.ShowPathbar = true;
            controlcenter.Sound = true;
            dock.autohide = true;
            dock.mru-spaces = false;
            dock.expose-group-apps = true;
            dock.orientation = "left";
            dock.show-recents = false;
            spaces.spans-displays = true;
          };
          system.defaults.dock.persistent-apps = [
            "/Applications/Safari.app"
            "/Applications/WezTerm.app"
            "/Applications/Ghostty.app"
            "/Applications/Slack.app"
            "/Applications/Microsoft Outlook.app"
            "/Applications/Microsoft Teams.app"
            "/System/Applications/System Settings.app"
            "/System/Applications/Utilities/Activity Monitor.app"
          ];

        };
      userConfig =
        { name }:
        { pkgs, ... }:
        {
          users.users.${name} = {
            name = name;
            home = "/Users/${name}";
            shell = pkgs.fish;
          };
        };

    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#Brams-MacBook-Air
      darwinConfigurations."Brams-MacBook-Air" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          (userConfig { name = "bram"; })
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.bram = import ./home.nix;
            home-manager.extraSpecialArgs = {
              home.userName = "bram";
              home.homeDirectory = "/Users/bram";
            };
          }
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = "bram";
            };
          }
        ];
      };

      darwinConfigurations."A1519" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          (userConfig { name = "bram.vanmeurs"; })
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users."bram.vanmeurs" = import ./home.nix;
            home-manager.extraSpecialArgs = {
              home.userName = "bram.vanmeurs";
              home.homeDirectory = "/Users/bram.vanmeurs";
            };
          }
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = "bram.vanmeurs";
            };
          }
        ];
      };
      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations."Brams-MacBook-Air".pkgs;
    };
}
