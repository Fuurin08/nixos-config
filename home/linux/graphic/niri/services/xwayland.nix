{
  pkgs,
  ...
}:

{
  home.packages = [
    pkgs.xwayland-satellite
  ];

  systemd.user.services.xwayland-satellite = {
    Unit = {
      Description = "XWayland Satellite";
      PartOf = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
      Requisite = [ "graphical-session.target" ];
    };
    Install = {
      WantedBy = [ "niri.service" ];
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.xwayland-satellite}/bin/xwayland-satellite :0";
      NotifyAccess = "all";
      Restart = "on-failure";
    };
  };
}
