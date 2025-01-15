{
  pkgs,
  config,
  ...
}:

{
  home.packages = with pkgs; [
    swaybg
  ];

  systemd.user.services.swaybg = {
    Unit = {
      PartOf = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
      Requisite = [ "graphical-session.target" ];
    };
    Install = {
      WantedBy = [ "niri.service" ];
    };
    Service = {
      ExecStart = "${pkgs.swaybg}/bin/swaybg -m fill -i %h/Pictures/wallpaper/waneella.jpg";
      Restart = "on-failure";
    };
  };

}
