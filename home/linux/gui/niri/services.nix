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
  };
  systemd.user.services.waybar = {
    Unit = {
      After = [ "niri.service" ];
    };
  };
}
