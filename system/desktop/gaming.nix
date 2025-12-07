{
  pkgs,
  ...
}:

{
  programs = {
    gamescope = {
      enable = true;
    };

    steam = {
      # Some location that should be persistent:
      #   ~/.local/share/Steam - The default Steam install location
      #   ~/.local/share/Steam/steamapps/common - The default Game install location
      #   ~/.steam/root        - A symlink to ~/.local/share/Steam
      #   ~/.steam             - Some Symlinks & user info
      enable = true;

      extraCompatPackages = [
        pkgs.proton-ge-bin
      ];

      gamescopeSession.enable = true;

      # Whether to enable protontricks, a simple wrapper for running Winetricks commands for Proton-enabled games.
      protontricks.enable = true;

      # Whether to enable Load the extest library into Steam, to translate X11 input events to uinput events (e.g. for using Steam Input on Wayland) .
      extest.enable = true;

      fontPackages = with pkgs; [
        # Steam chinese font
        wqy_zenhei
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    mangohud
    # lutris
  ];

  programs.gamemode = {
    enable = true;
    settings = {
      general = {
        softrealtime = "auto";
        renice = 15;
      };
    };
  };

  # hardware.xone.enable = true;
  # hardware.xpadneo.enable = true;
}
