{
  imports = [
    ./greetd.nix
    ./peripherals.nix
    ./graphic.nix
    ./font.nix
  ];

  services.dbus.implementation = "broker";

  # fix swaylock cannot be unlocked with the correct password
  security.pam.services.swaylock = { };
}
