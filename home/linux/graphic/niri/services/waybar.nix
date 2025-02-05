{
  pkgs,
  ...
}:

{
  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
      target = "niri.service";
    };

    settings = [
      {
        layer = "top";
        position = "top";

        modules-left = [
          "niri/workspaces"
          "niri/window"
        ];
        modules-center = [
          "clock"
          "privacy"
        ];
        modules-right = [
          "network"
          "cpu"
          "temperature"
          "memory"
          "backlight"
          "pulseaudio"
          "wireplumber"
          "battery"
          "tray"
        ];
        "privacy" = {
          icon-spacing = 4;
          icon-size = 20;
          transition-duration = 250;
          modules = [
            {
              type = "aduio-in";
              tooltip = true;
              tooltip-icon-size = 24;
            }
            {
              type = "aduio-out";
              tooltip = true;
              tooltip-icon-size = 24;
            }
            {
              type = "screenshare";
              tooltip = true;
              tooltip-icon-size = 24;
            }
          ];
        };
        "network" = {
          interval = 5;
          format = "{ifname}:  {bandwidthDownBytes}  {bandwidthUpBytes}";
          format-ethernet = "󰱓  {ifname}:  {bandwidthDownBytes}  {bandwidthUpBytes}";
          format-wifi = "  {essid}({signaldBm}d):  {bandwidthDownBytes}  {bandwidthUpBytes}";
          format-disconnected = "󰅛   Disconnected";
        };
        "cpu" = {
          interval = 5;
          format = "  {usage}% ";
        };
        "temperature" = {
          interval = 5;
          format = "  {temperatureC}°C ";
        };
        "memory" = {
          interval = 5;
          format = "  {}% ";
        };
        "backlight" = {
          format = "{icon}  {percent}% ";
          format-icons = [
            ""
            ""
          ];
        };
        "pulseaudio" = {
          format = "{icon}  {volume}% ";
          format-bluetooth = "󰂯{icon}  {volume}% ";
          format-muted = "󰖁";
          format-icons = {
            default = [
              "󰕿"
              "󰖀"
              "󰕾"
            ];
          };
          on-click = "pavucontrol";
          #on-click-right = lib.escapeShellArgs volumeMute;
          #on-scroll-up = lib.escapeShellArgs volumeUp;
          #on-scroll-down = lib.escapeShellArgs volumeDown;
        };
        "wireplumber" = {
          format = "{icon}  {volume}% ";
          format-muted = "󰖁";
          format-icons = [
            "󰕿"
            "󰖀"
            "󰕾"
          ];
          on-click = "pavucontrol";
          #on-click-right = lib.escapeShellArgs volumeMute;
          #on-scroll-up = lib.escapeShellArgs volumeUp;
          #on-scroll-down = lib.escapeShellArgs volumeDown;
        };
        "battery" = {
          interval = 60;
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon}  {capacity}% ";
          format-plugged = "  {capacity}% ";
          format-icons = [
            "󰂎"
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
        };
        "clock" = {
          tooltip = false;
          format = "{:%a.%H:%M}";
        };
      }
    ];
  };
  systemd.user.services.waybar = {
    Unit = {
      After = [ "niri.service" ];
    };
  };
}
