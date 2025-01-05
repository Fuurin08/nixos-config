{
  config,
  #niri,
  pkgs,
  ...
}:

{
  # imports = [ inputs.niri.homeModules.niri ];

  home.packages = with pkgs; [
    niri
  ];

  #programs.niri = {
  #enable = true;
  #  settings = {
  #    environment = {
  #      XDG_CURRENT_DESKTOP = "niri";
  #    };
  #    spawn-at-startup = [
  #      { command = [ "waybar" ]; }
  #      { command = [ "fcitx5" ]; }
  #    ];
  #    binds = with config.lib.niri.actions; {
  #      "Mod+Return".action.spawn = [ "kitty" ];
  #      "Mod+Space".action.spawn = [ "anyrun" ];
  #
  #      "Mod+Q".action = close-window;
  #
  #      "Mod+H".action = focus-column-left;
  #      "Mod+J".action = focus-window-down;
  #      "Mod+K".action = focus-window-up;
  #      "Mod+L".action = focus-column-right;
  #
  #      "Mod+Ctrl+H".action = move-column-left;
  #      "Mod+Ctrl+J".action = move-window-down;
  #      "Mod+Ctrl+K".action = move-window-up;
  #      "Mod+Ctrl+L".action = move-column-right;
  #
  #     "Mod+1".action = focus-workspace 1;
  #     "Mod+2".action = focus-workspace 2;
  #     "Mod+3".action = focus-workspace 3;
  #   };
  # };
  #};
  xdg.configFile."niri/config.kdl".source = ./config.kdl;
}
