{
  lib,
  ...
}:

{
  imports = [
    ./core.nix
    ./users.nix
    ./i18n.nix
  ];

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };
}
