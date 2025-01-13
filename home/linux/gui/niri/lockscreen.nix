{
  pkgs,
  ...
}:

{
  # lock screen
  programs.swaylock = {
    enable = true;
  };
  xdg.configFile."swaylock/config".source = ./swaylock.conf;

  # Idle management daemon for wayland
  services.swayidle =
    let
      swaylock = "${pkgs.swaylock}/bin/swaylock";
      niri = "${pkgs.niri}/bin/niri";
      systemctl = "${pkgs.systemd}/bin/systemctl";
    in
    {
      enable = true;
      systemdTarget = "niri.service";
      extraArgs = [
        "-d" # debug output
        "-w" # wait for command
        "-S"
        "$XDG_SEAT"
        #"idlehint"
        #"10"
      ];
      events = [
        {
          event = "before-sleep";
          command = "${swaylock} -f";
        }
        {
          event = "lock";
          command = "${swaylock} -f";
        }
      ];
      timeouts = [
        {
          timeout = 300;
          command = "${swaylock} -f";
        }
        {
          timeout = 330;
          command = "${niri} msg action power-off-monitors";
        }
        {
          timeout = 3600;
          command = "${systemctl} suspend";
        }
      ];
    };
}
