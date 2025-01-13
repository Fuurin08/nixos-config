{
  ...
}:

{
  # notification daemon for wayland
  services.mako = {
    enable = true;
  };

  xdg.configFile = {
    "mako/conf" = {
      source = ./config;
    };
  };
}
