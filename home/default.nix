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




  
  programs.home-manager.enable = true;
}
