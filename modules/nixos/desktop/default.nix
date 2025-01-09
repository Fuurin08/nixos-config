{
  imports = [
    ./greetd.nix
    ./peripherals.nix
    ./graphic.nix
    ./font.nix
  ];

  # fix swaylock cannot be unlocked with the correct password
  security.pam.services.swaylock = { };
}
