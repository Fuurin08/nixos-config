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

    ../linux/graphic
    ../linux/programs
    ../linux/term
    ../linux/shell
    ../linux/editors
  ];

  programs.git = {
    enable = true;
    userName = "Fuurin08";
    userEmail = "zdf1205654975@gmail.com";
  };

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "24.05";
  };

  home.packages = with pkgs; [
    # ripgrep
    # fzf
    # wluma
    wiliwili
  ];

  #programs.obs-studio = {
  #  enable = true;
  #};

  programs.vscode = {
    enable = true;
    package = pkgs.vscode-fhs;
  };

  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host github.com
          Hostname ssh.github.com
          Port 443
          User git
    '';
  };

  programs.home-manager.enable = true;
}
