{ config, lib, pkgs, ... }:

{
  #imports = [ ];
  
  #home.packages = with pkgs; [
  #  waybar
  #];
  #
  #home.file.".config/waybar/config".source = ./config;
  #home.file.".config/waybar/style.css".source = ./style.css;
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 24;
        output = [
          "DP-1"
          "HDMI-A-1"
        ];
        modules-left = [ "disk" "network" ];
        modules-center = [ "clock" ];
        modules-right = [ "pulseaudio" "cpu" "memory" "tray" ];

        "tray" = {
          spacing = 10;
          # icon-size = 10;
        };
        "clock" = {
          interval = 1;
          timezone = "Asia/Shanghai";
          format = "{:%m-%d %H:%M:%S}";
        };
        "cpu" = {
          format = "<b></b> {usage}%";
        };
        "memory" = {
          interval = 10;
          format = "<b></b> {}%";
        };
        "network" = {
          interval = 5;
          tooltip = true;
          format = "{bandwidthUpBits} {bandwidthDownBits}";
        };
        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-bluetooth = "{volume}% {icon}";
          format-muted =  "";
          format-icons = {
            headphones = "";
            handsfree = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" ""];
          };
        };
        "disk" = {
          interval = 60;
          path = "/";
          format = "﫭{free} ";
        };
      };
    };
    style = ''
      * {
          border: none;
          border-radius: 0;
          font-family: "JetBrains Mono";
          font-size: 13px;
          min-height: 0;
      }

      window#waybar {
      background: transparent;
      color: white;
      }

      #window {
          font-weight: bold;
          font-family: "JetBrains Mono";
      }

      #workspaces {
          padding: 0 5px;
      }

      #workspaces button {
          padding: 0 5px;
          background: transparent;
          color: white;
          border-top: 2px solid transparent;
      }

      #workspaces button.focused {
          color: #c9545d;
          border-top: 2px solid #c9545d;
      }

      #mode {
          background: #64727D;
          border-bottom: 3px solid white;
      }

      #clock, #battery, #cpu, #memory, #network, #pulseaudio, #custom-spotify, #tray, #mode, #disk {
          padding: 0 3px;
          margin: 0 2px;
          color: white;
      }

      #clock {
          font-weight: bold;
      }

      /*
      #battery {
      }

      #battery icon {
          color: red;
      }

      #battery.charging {
      }
      */
      
      @keyframes blink {
          to {
              background-color: #ffffff;
              color: black;
          }
      }
      
      #cpu {
      }
      
      #memory {
      }
      
      #network {
      }
      
      #network.disconnected {
          background: #f53c3c;
      }
      
      #pulseaudio {
      }
      
      #pulseaudio.muted {
      }
      
      /*
      #custom-spotify {
          color: rgb(102, 220, 105);
      }
      */
      
      #tray {
      }
    '';
  };
}
