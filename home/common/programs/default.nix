{
  pkgs,
  ...
}:

{
  imports = [
    ./fcitx5
    ./browsers
    ./obs.nix
  ];

  home.packages = with pkgs; [
    # kicad
    vesktop
    krita
    gimp
    # kdePackages.kdenlive

    kazumi
    wiliwili
    go-musicfox
  ];
}
