{
  ...
}:

{
  imports = [
    ./swaylock
    ./mako.nix
    ./anyrun
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
