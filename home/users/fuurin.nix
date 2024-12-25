{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./wm
    ./programs
    ./term
    ./shell
    ./editors
  ];

  home = {
    username = "fuurin";
    homeDirectory = "/home/fuurin";
    stateVersion = "24.05";
  };

  home.packages = with pkgs;[
    # ripgrep
    # fzf
    # wluma
  ];

  programs.obs-studio = {
    enable = true;
#    plugins = with pkgs.obs-studio-plugins; [
#      wlrobs
#    ];
  };

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
