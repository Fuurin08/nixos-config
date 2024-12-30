{
  lib,
  ...
}:

{
  imports = [
    ./core.nix
    ./users.nix
    ./i18n.nix
    ./nix.nix
    #./ssh.nix
  ];
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
    };
  };

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };
}
