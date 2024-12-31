{
  pkgs,
  lib,
  ...
}:

{
  # acpi daemon
  services.acpid.enable = false;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.displayManager.sddm.enable = false;
  services.xserver.displayManager.gdm.enable = false;
  services.xserver.displayManager.lightdm.enable = false;

  services.xserver.excludePackages = with pkgs; [
    xterm
  ];

  services.v2raya.enable = true;

}
