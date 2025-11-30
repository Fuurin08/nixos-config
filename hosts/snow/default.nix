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

    ../../modules/nixos/base

    # desktop
    ../../modules/nixos/desktop/greetd.nix
    ../../modules/nixos/desktop/font.nix
    ../../modules/nixos/desktop/graphic.nix
    ../../modules/nixos/desktop/peripherals.nix
    ../../modules/nixos/desktop/security.nix
    ../../modules/nixos/desktop/gameing.nix
    ../../modules/nixos/desktop/misc.nix
  ];

  networking.hostName = "snow"; # Define your hostname.

  # System Version
  system.stateVersion = "25.11"; # Did you read the comment?
}
