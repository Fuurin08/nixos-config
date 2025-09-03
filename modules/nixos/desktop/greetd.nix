{
  pkgs,
  ...
}:
let
  username = "fuurin";
in

{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --remember-session --cmd niri-session";
        user = username;
      };
    };
  };

  # systemd error message on tuigreet
  # https://github.com/apognu/tuigreet/issues/68#issuecomment-1586359960
  #systemd.services.greetd.serviceConfig = {
  #  Type = "idle";
  #  StandardInputs = "tty";
  #  StandardOutput = "tty";
  #  StandardError = "journal";
  #  TTYReset = true;
  #  TTYVHangup = true;
  #  TTYVTDisallocate = true;
  #};
}
