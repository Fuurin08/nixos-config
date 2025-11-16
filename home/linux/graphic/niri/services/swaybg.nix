{
  pkgs,
  config,
  inputs,
  ...
}:
let
  wallpaper = "${inputs.wallpapers}/eva-ayanamirei.png";
in
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
      ExecStart = "${pkgs.swaybg}/bin/swaybg -m fill -i ${wallpaper}";
      Restart = "on-failure";
    };
  };
}
