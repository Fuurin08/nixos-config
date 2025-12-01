{
  ...
}:

{
  programs.swaylock = {
    enable = true;
  };

  stylix.targets.swaylock.enable = true;
  #xdg.configFile."swaylock/config".source = ./swaylock.conf;
}
