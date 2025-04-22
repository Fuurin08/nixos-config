{
  pkgs,
  ...
}:

{
  imports = [
    ./steam.nix
    ./gamemode.nix
  ];

  environment.systemPackages = with pkgs; [
    mangohud
  ];

  #hardware.xone.enable = true;
  hardware.xpadneo.enable = true;
}
