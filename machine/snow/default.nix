{
  pkgs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware.nix
    ./disko.nix
    ./secureboot.nix
    ./preservation.nix
    ./virtualisation.nix
    ./power.nix

    ../../modules/hardware/amdgpu.nix

    ../../modules/common

    ../../system/base

    # desktop
    ../../system/desktop/greetd.nix
    ../../system/desktop/font.nix
    ../../system/desktop/graphic.nix
    ../../system/desktop/peripherals.nix
    ../../system/desktop/security.nix
    ../../system/desktop/gaming.nix
    ../../system/desktop/misc.nix
  ];

  networking.hostName = "snow"; # Define your hostname.

  # System Version
  system.stateVersion = "25.11"; # Did you read the comment?
}
