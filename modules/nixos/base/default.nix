{
  imports = [
    ./boot.nix
    ./users.nix
    ./i18n.nix
    ./nix.nix
    ./network.nix
    ./ssh.nix
  ];

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  services.power-profiles-daemon.enable = true;
}
