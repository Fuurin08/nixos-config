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
          "disk"
          "niri/workspaces"
          "cpu"
          "temperature"
          "memory"
          "privacy"
          "gamemode"
        ];
        modules-center = [
          "niri/window"
        ];
        modules-right = [
          "tray"
          "network"
          "backlight"
          "pulseaudio"
          #"wireplumber"
          "battery"
          "power-profiles-daemon"
          "clock"
        ];
        "niri/workspaces" = {
          disable-click = false;
          current-only = false;
          all-outputs = true;
          #format = "{icon}";
          #format-icons = {
          #  "1" = "<span color='#cc241d' >󰊠</span>";
          #  "2" = "<span color='#98971a' >󰊠</span>";
          #  "3" = "<span color='#d79921' >󰊠</span>";
          #  "4" = "<span color='#458588' >󰊠</span>";
          #  "5" = "<span color='#b16286' >󰊠</span>";
          #  "6" = "<span color='#689d6a' >󰊠</span>";
          #  "7" = "<span color='#fe8019' >󰊠</span>";
          #  "default" = "<span color='#cc241d'>󰊠</span>";
          #};
        };
        "niri/window" = {
          format = "󰊠  {title}";
          max-length = 50;
        };
        "clock" = {
          tooltip = false;
          format = "󱑍  {:%H:%M}";
        };
        "privacy" = {
          icon-spacing = 4;
          icon-size = 16;
          transition-duration = 250;
          modules = [
            {
              type = "aduio-in";
              tooltip = true;
              tooltip-icon-size = 16;
            }
            {
              type = "aduio-out";
              tooltip = true;
              tooltip-icon-size = 16;
            }
            {
              type = "screenshare";
              tooltip = true;
              tooltip-icon-size = 16;
            }
          ];
        };
        "network" = {
          interval = 5;
          format = "{ifname}}";
          format-ethernet = "󰈀  {ifname}";
          format-wifi = "  {essid}({signaldBm}d)";
          format-disconnected = "󰅛   Disconnected";
        };
        "disk" = {
          interval = 30;
          format = "  /:{percentage_used}%";
          path = "/";
        };
        "cpu" = {
          interval = 5;
          format = "  {usage}%";
        };
        "temperature" = {
          interval = 5;
          format = "  {temperatureC}°C";
        };
        "memory" = {
          interval = 5;
          format = "  {}%";
        };
        "backlight" = {
          format = "{icon}  {percent}%";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
        };
        "pulseaudio" = {
          format = "{icon} {volume}% {format_source}";
          format-bluetooth = "{icon}󰂯 {volume}% {format-source}";
          format-bluetooth-muted = "{icon} {format_source}";
          format-muted = "󰖁";
          format-source = " {volume}%";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
              "󰕿"
              "󰖀"
              "󰕾"
            ];
          };
          on-click = "pavucontrol";
        };
        "wireplumber" = {
          format = "{volume}%";
          format-muted = "󰖁";
          format-icons = [
            "󰕿"
            "󰖀"
            "󰕾"
          ];
          on-click = "pavucontrol";
        };
        "battery" = {
          interval = 60;
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}% 󱐋{power}W";
          format-plugged = " {capacity}%";
          format-charging = " {capacity}%";
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
        "tray" = {
          icon-size = 16;
          spacing = 4;
        };
        "power-profiles-daemon" = {
          format = "{icon}  {profile}";
          tooltip-format = "Power profile: {profile}\nDriver: {driver}";
          tooltip = true;
          format-icons = {
            default = "";
            performance = "";
            balanced = " ";
            power-saver = " ";
          };
        };
        "gamemode" = {
          format = "{glyph}";
          format-alt = "{glyph} {count}";
          glyph = "󰊗 ";
          hide-not-running = true;
          use-icon = true;
          icon-name = "input-gaming-symbolic";
          icon-spacing = 4;
          icon-size = 20;
          tooltip = true;
          tooltip-format = "Games running: {count}";
        };
      }
    ];
    style = ''
      window#waybar {
          /* background: transparent; */
          background-color: alpha(@base00, 0.9);
      }
      tooltip {
          background: alpha(@base01, 0.8);
          border-radius: 8px;
          border-width: 2px;
          border-style: solid;
          border-color: @base07;
      }
      .modules-left {
          padding: 0px 6px;
          /* top right bottom left */
          margin: 4px 4px 4px 4px;
          border-radius: 8px;
          background: alpha(@base01,.8);
          box-shadow: 1px 2px 2px rgba(0, 0, 0, .95);
      }
      .modules-center {
          padding: 0px 6px;
          /* top right bottom left */
          margin: 4px 4px 4px 4px;
          border-radius: 8px;
          background: alpha(@base01,.8);
          box-shadow: 1px 2px 2px rgba(0, 0, 0, .95);
      }
      .modules-right {
          padding: 0px 6px;
          /* top right bottom left */
          margin: 4px 4px 4px 4px;
          border-radius: 8px;
          background: alpha(@base01,.8);
          box-shadow: 1px 2px 2px rgba(0, 0, 0, .95);
      }
      #disk,
      #workspaces,
      #window,
      #network,
      #privacy,
      #cpu,
      #temperature,
      #memory,
      #backlight,
      #pulseaudio,
      #wireplumber,
      #tray,
      #battery,
      #clock {
          padding: 2px 8px;
          color: @base05;
          text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.377);
          border-radius: 0px;
      }
      #tray {
          border-top: 3px solid @base06;
      }
      #workspaces button {
          /* margin: 2px; */
          padding: 0px 2px;
          /* background: alpha(@base01, 0.5); */
          color: @base05;
          border-top: 3px solid transparent;
          border-radius: 4px;
      }

      #workspaces button.active {
          /* margin: 2px; */
          padding: 0px 2px;
          background: alpha(@base03, 0.9);
          border-top: 3px solid @base06;
          border-radius: 4px;
      }
    '';
  };
  systemd.user.services.waybar = {
    Unit = {
      After = [ "niri.service" ];
    };
  };
}
