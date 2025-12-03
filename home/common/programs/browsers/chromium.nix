{
  programs.chromium = {
    enable = true;

    # package = pkgs.brave;

    commandLineArgs = [
      #From: https://wiki.archlinuxcn.org/wiki/Chromium
      # web features
      "--enable-experimental-web-platform-features"

      # video acceleration
      "--enable-features=AcceleratedVideoDecodeLinuxGL"
    ];
  };
}
