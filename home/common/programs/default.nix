{
  pkgs,
  ...
}:

{
  imports = [
    ./fcitx5
    ./browsers.nix
    ./obs.nix
    ./vicinae.nix
  ];

  home.packages = with pkgs; [
    zed-editor
  ];
}
