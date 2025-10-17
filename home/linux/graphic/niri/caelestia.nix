{
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.niri-caelestia-shell.homeManagerModules.default
  ];

  programs.caelestia = {
    enable = true;
    systemd.enable = false;
    cli = {
      enable = true;
      settings = {
        enableTerm = false;
        enableDiscord = false;
        enableSpicetify = false;
        enableBtop = false;
        enableCava = false;
        enableGtk = false;
        enableQt = false;
      };
    };
    settings = {
      background.enabled = false;
      # dashboard.enabled = false;
      bar = {
        persistent = true;
        status = {
          showAudio = false;
          showBluetooth = false;
        };
        tray = {
          background = true;
          recolour = true;
        };
        entries = [
          {
            id = "logo";
            enabled = true;
          }
          {
            id = "spacer";
            enabled = true;
          }
          {
            id = "activeWindow";
            enabled = true;
          }
          {
            id = "spacer";
            enabled = true;
          }
          {
            id = "tray";
            enabled = true;
          }
          {
            id = "clock";
            enabled = true;
          }
          {
            id = "statusIcons";
            enabled = true;
          }
          {
            id = "power";
            enabled = true;
          }
        ];
        services = {
          weatherLocation = "";
          useFahrenheit = false;
          smartScheme = false;
          useTwelveHourClock = false;
        };
      };
    };
  };
}
