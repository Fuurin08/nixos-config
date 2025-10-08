{
  pkgs,
  ...
}:

{
  imports = [
    ./fcitx5
    ./browsers.nix
    ./obs.nix
  ];

  home.packages = with pkgs; [

  ];
}
