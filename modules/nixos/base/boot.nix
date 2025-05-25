{
  pkgs,
  ...
}:

{
  boot = {
    #kernelPackages = pkgs.linuxPackages_latest;
    kernelPackages = pkgs.linuxPackages_zen;
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      systemd-boot = {
        enable = true;
        consoleMode = "auto";
      };
      timeout = 5;
    };
    supportedFilesystems = [
      "btrfs"
      "ntfs"
    ];
  };
}
