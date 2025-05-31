{
  ...
}:

{
  imports = [
    ./swaylock
    ./mako.nix
  ];

  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        dpi-aware = "yes";
        width = "20";
        horizontal-pad = "20";
      };
    };
  };
}
