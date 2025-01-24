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

  home.packages = with pkgs; [
    # ripgrep
    # fzf
    # wluma
    wiliwili
  ];

  programs.git = {
    enable = true;
    userName = "Fuurin08";
    userEmail = "zdf1205654975@gmail.com";
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

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
}
