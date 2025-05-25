{
  ...
}:

{
  # notification daemon for wayland
  # manual -> man 5 mako
  services.mako = {
    enable = true;

    settings = {
      anchor = "top-right";
      sort = "-time";
      max-visible = "5";
      layer = "top";

      default-timeout = "8000";
      ignore-timeout = "false";

      markup = true;
      margin = "10,20,5";

      icons = true;
      max-icon-size = "64";
      
      width = "300";
      height = "100";

      padding = "5";

      border-size = "3";
      border-radius = "8";
    };

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
