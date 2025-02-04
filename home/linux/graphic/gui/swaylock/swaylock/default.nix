{
  ...
}:

{
  programs.swaylock = {
    enable = true;
  };

  #xdg.configFile."swaylock/config".source = ./swaylock.conf;
}
