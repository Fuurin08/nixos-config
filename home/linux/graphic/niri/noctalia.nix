{
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  home.packages = with pkgs; [
    inputs.noctalia.packages.${system}.default
  ];

  # services.noctalia-shell.enable = true;

  programs.noctalia-shell = {
    enable = true;
    settings = {
      setupCompleted = true;
      colorSchemes = {
        darkMode = true;
        # predefinedScheme = "Everforest";
        predefinedScheme = "Catppuccin";
      };
      dock.enabled = false;
      bar = {
        position = "top";
        backgroundOpacity = 0.8;
        mointros = [ ];
        density = "default";
        showCapsule = true;
        floating = false;
        outerCorners = true;
        marginVertical = 0.25;
        marginHorizontal = 0.25;
        widgets = {
          left = [
            {
              id = "NotificationHistory";
            }
            {
              id = "SystemMonitor";
              showCpuUsage = true;
              showCpuTemp = true;
              showMemoryUsage = true;
              showMemoryAsPercent = true;
            }
            {
              id = "Workspace";
              labelMode = "none";
            }
            {
              id = "MediaMini";
            }
          ];
          center = [
            {
              id = "ActiveWindow";
              showIcon = true;
              hideMode = "hidden";
              scrollingMode = "hover";
              width = 200;
              colorizeIcons = false;
            }
          ];
          right = [
            {
              id = "Tray";
              colorizeIcons = false;
              drawerEnabled = false;
            }
            {
              id = "Battery";
              displayMode = "alwaysShow";
            }
            {
              id = "Volume";
              displayMode = "alwaysShow";
            }
            {
              id = "Microphone";
              displayMode = "alwaysShow";
            }
            {
              id = "Brightness";
              displayMode = "alwaysShow";
            }
            {
              id = "Clock";
            }
          ];
        };
      };
    };
  };

  systemd.user.services.noctalia-shell =
    let
      noctaliaPackage = inputs.noctalia.packages.${pkgs.system}.default;
    in
    {
      Unit = {
        PartOf = [ "graphical-session.target" ];
        After = [ "graphical-session.target" ];
        Requisite = [ "graphical-session.target" ];
      };
      Install = {
        WantedBy = [ "graphical-session.target" ];
      };
      Service = {
        ExecStart = "${noctaliaPackage}/bin/noctalia-shell";
        Restart = "on-failure";
      };
    };
}
