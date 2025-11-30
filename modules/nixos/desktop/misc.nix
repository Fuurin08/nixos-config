{
  programs.dconf.enable = true;

  services.dbus.implementation = "broker";

  programs.xwayland.enable = true;

  services.v2raya.enable = true;
}
