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
    anchor = "top-right";

    defaultTimeout = 5000;
    ignoreTimeout = false;

    margin = "10,20,5";
    markup = true;

    icons = true;
    maxIconSize = 64;

    width = 300;
    height = 100;

    padding = "5";

    borderSize = 3;
    borderRadius = 8;

    #extraConfig = ''
    #  max-history=100

    #  text-alignment=center

    # BINDING OPTIONS
    #on-button-left=dismiss
    #on-button-middle=none
    #on-button-right=dismiss-all
    #on-touch=dismiss
    #on-notify=exec mpv
    #'';
  };
}
