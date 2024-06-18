{
  config,
  pkgs,
  ...
}:

{
  programs.kitty = {
    enable = true;

    theme = "Catppuccin-Mocha";
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 13;
    };

    settings = {
      background_opacity = "0.8";

      enabel_audio_bell = false;

      cursor_shape = "block";

      # initial_window_width  = "640";
      # initial_window_height = "400";

      shell = "${pkgs.bash}/bin/bash --login -c 'nu --login --interactive'";
    };
  };
}