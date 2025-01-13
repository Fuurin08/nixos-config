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

  systemd.user.services.swaylock = {
    Unit = {
      ConditionEnvironment = [
        "WAYLAND_DISPLAY"
      ];
      PartOf = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
      Wants = [ "swayidle-locked.service" ];
    };
    Service = {
      Type = "forking";
      ExecStartPre = "${pkgs.niri}/bin/niri msg action do-screen-transition --delay-ms 1000";
      ExecStart = "${pkgs.swaylock}/bin/swaylock -f";
      KillSignal = "SIGUSR1";
    };
  };

  systemd.user.services.swayidle-locked = {
    Unit = {
      ConditionEnvironment = [
        "WAYLAND_DISPLAY"
        "XDG_SEAT"
      ];
      PartOf = [ "graphical-session.target" ];
      BindsTo = [ "swaylock.service" ];
      After = [
        "swaylock.service"
        "graphical-session.target"
      ];
    };
    Service = {
      ExecStart = "${pkgs.swayidle}/bin/swayidle -d -w -S \"$XDG_SEAT\" timeout 10 \"niri msg action power-off-monitors\"";
    };
  };

  # Idle management daemon for wayland
  services.swayidle =
    let
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
        #"300"
      ];
      events = [
        {
          event = "before-sleep";
          command = "${systemctl} --user start swaylock";
        }
        {
          event = "lock";
          command = "${systemctl} --user start swaylock";
        }
        {
          event = "unlock";
          command = "${systemctl} --user stop swaylock";
        }
      ];
      timeouts = [
        {
          timeout = 300;
          command = "${systemctl} --user start swaylock";
        }
        {
          timeout = 3600;
          command = "${systemctl} suspend";
        }
      ];
    };
}
