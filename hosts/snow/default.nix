{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware.nix

    ../amdgpu.nix
    ../auto-cpufreq.nix
    #./system.nix

    ../../modules/common
    ../../modules/nixos/base
    ../../modules/nixos/game/steam.nix
    ../../modules/nixos/desktop
  ];

  networking.hostName = "snow"; # Define your hostname.

  # System Version
  system.stateVersion = "24.05"; # Did you read the comment?

}
