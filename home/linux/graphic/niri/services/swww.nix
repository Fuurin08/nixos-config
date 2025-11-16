{
  pkgs,
  inputs,
  ...
}:
let
  wallpaper = "${inputs.wallpapers}/eva-ayanamirei.png";

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
      ExecStart = "${pkgs.swww}/bin/swww img --transition-type none ${wallpaper}";
      Restart = "on-failure";
    };
  };
}
