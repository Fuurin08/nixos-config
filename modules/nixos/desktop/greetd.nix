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
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd niri-session";
        user = username;
      };
    };
  };
}
