{
  pkgs,
  config,
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
        predefinedScheme = "catppuccin";
      };
      bar = {
        position = "top";
        backgroundOpacity = 0.7;
        mointros = [ ];
        density = "default";
        showCapsule = true;
        floating = true;
        marginVertical = 0.25;
        marginHorizontal = 0.25;
        widgets = {
          left = [
            {
              id = "SystemMonitor";
            }
            {
              id = "MediaMini";
            }
            {
              id = "ActiveWindow";
            }
          ];
          center = [
            {
              id = "Workspace";
            }
          ];
          right = [
            {
              id = "Tray";
            }
            {
              id = "NotificationHistory";
            }
            {
              id = "Battery";
            }
            {
              id = "Volume";
            }
            {
              id = "Brightness";
            }
            {
              id = "Clock";
            }
            {
              id = "ControlCenter";
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
