{
  config,
  pkgs,
  ...
}:
let
  username = "fuurin";
in
{
  imports = [
    ../common/base

    ../terminal

    ../common/editors
    ../common/programs
    ../common/game

    ../common/stylix.nix
    # ../common/gtk.nix
    # ../common/qt.nix
    ../common/flatpak.nix

    ../linux/graphic
  ];

  home.packages = with pkgs; [
    # ripgrep
    # fzf
    # wluma
    wiliwili
  ];

  programs.git = {
    enable = true;
    settings = {
      user.name = "Fuurin08";
      user.email = "zdf1205654975@gmail.com";
    };
  };

  programs.ssh = {
    enable = true;
    matchBlocks."*" = {
      compression = true;
      controlMaster = "no";
      controlPath = "~/.ssh/master-%r@%n:%p";
      controlPersist = "no";
    };
    matchBlocks = {
      "github.com" = {
        hostname = "ssh.github.com";
        port = 443;
        user = "git";
        identitiesOnly = true;
      };
    };
  };

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
}
