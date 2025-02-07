{
  imports = [
    ./kitty.nix
    ./yazi
    ./btop.nix
  ];

  programs.ghostty.enable = true;
  programs.foot.enable = false;
}
