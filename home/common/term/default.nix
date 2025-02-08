{
  imports = [
    ./kitty.nix
    ./shell.nix
  ];

  programs.ghostty.enable = true;
  programs.foot.enable = false;
}
