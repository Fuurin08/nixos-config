{
  # polkit
  security.polkit.enable = true;

  # fix swaylock cannot be unlocked with the correct password
  security.pam.services.swaylock = { };
}
