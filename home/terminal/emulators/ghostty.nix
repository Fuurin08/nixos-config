{
  ...
}:

{
  programs.ghostty = {
    enable = true;
    systemd.enable = true;
  };

  stylix.targets.ghostty.enable = true;
}
