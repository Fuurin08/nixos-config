{
  pkgs,
  inputs,
  ...
}:
let
  wallpaper = "${inputs.wallpapers}/2560x1600/BlueArchive-1.jpg";

in
{
  services.swww = {
    enable = true;
  };
  # home.packages = with pkgs; [
  #   swww
  # ];

  systemd.user.services.swww-img = {
    Unit = {
      PartOf = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
      Requisite = [ "graphical-session.target" ];
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.swaybg}/bin/swww img ${wallpaper}";
      Restart = "on-failure";
    };
  };
}
