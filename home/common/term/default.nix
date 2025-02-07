{
  imports = [
    ./kitty.nix
    ./yazi.nix
    ./btop.nix
    ./shell
  ];

  programs.ghostty.enable = true;
  programs.foot.enable = false;
}
