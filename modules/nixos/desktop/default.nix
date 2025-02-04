{
  imports = [
    ./greetd.nix
    ./peripherals.nix
    ./graphic.nix
    ./font.nix
  ];

  programs.dconf.enable = true;

  services.dbus.implementation = "broker";

  programs.xwayland.enable = true;

  services.v2raya.enable = true;
  # fix swaylock cannot be unlocked with the correct password
  security.pam.services.swaylock = { };
}
