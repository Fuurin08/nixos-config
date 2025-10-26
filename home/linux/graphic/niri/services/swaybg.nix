{
  pkgs,
  config,
  inputs,
  ...
}:
let
  wallpaper = "${inputs.wallpapers}/2560x1600/BlueArchive-1.jpg";
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
