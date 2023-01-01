{ ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      window = {
        dimensions = {
          columns = 0;
          lines = 0;
        };
        dynamic_padding = true;
        decorations = "none";
        opacity = 0.7;
        title = "Alacritty";
        dynamic_title = true;
        decorations_theme_variant = "dark";
      };
      scrolling = {
        history = 10000;
        multiplier = 3;
      };
      font = {
        normal = {
          Default = {
            family = "JetBrains Mono";
            style = "Regular";
          };
        };
        size = 10;
      };
      colors = {
        primary = {
          background = "#0d0c0c";
          foreground = "#0f78d4";
        };
        cursor = {
          text = "CellBackground";
          cursor = "#cf8295";
        };
        normal = {
          black =  "#1d1f21";
          red = "#cc6666";
          green = "#b5bd68";
          yellow = "#f0c674";
          blue = "#81a2be";
          magenta = "#b294bb";
          cyan = "#8abeb7";
          white = "#c5c8c6";
        };
        bright = {
          black = "#666666";
          red = "#d54e53";
          green = "#b9ca4a";
          yellow = "#e7c547";
          blue = "#7aa6da";
          magenta = "#c397d8";
          cyan = "#70c0b1";
          white = "#eaeaea";
      };
        dim = {
          black = "#131415";
          red = "#864343";
          green = "#777c44";
          yellow = "#9e824c";
          blue = "#556a7d";
          magenta = "#75617b";
          cyan = "#5b7d78";
          white = "#828482";
        };
      };
      cursor = {
        style = {
          shape = "Block";
          blinking = "Never";
        };
      };
    };
  };
}
