{
  ...
}:

{
  # notification daemon for wayland
  # manual -> man 5 mako
  services.mako = {
    enable = true;
    sort = "-time";
    maxVisible = 5;
    layer = "top";
    anchor = "top-center";

    font = "JetBrains Mono 10";

    defaultTimeout = 5000;
    ignoreTimeout = false;

    margin = "10,20,5";
    markup = true;

    icons = true;
    maxIconSize = 64;

    width = 300;
    height = 100;

    padding = "5";

    # Color Theme from catppuccin-macha
    borderSize = 2;
    borderRadius = 8;

    borderColor = "#89b4fa";
    backgroundColor = "#1e1e2e";
    progressColor = "over #313244";
    textColor = "#cdd6f4";

    extraConfig = ''
      max-history=100

      text-alignment=center

      # BINDING OPTIONS
      #on-button-left=dismiss
      #on-button-middle=none
      #on-button-right=dismiss-all
      #on-touch=dismiss
      #on-notify=exec mpv

      [urgency=low]
      border-color=#33FFFF
      default-timeout=3000

      [urgency=normal]
      border-color=#198CFF
      default-timeout=5000

      [urgency=high]
      border-color=#FF3E96
      text-color=#FF3E96
      default-timeout=0
    '';
  };

  #xdg.configFile = {
  #  "mako/config" = {
  #    source = ./config;
  #  };
  #};
}
