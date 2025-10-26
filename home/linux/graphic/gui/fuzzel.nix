{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        dpi-aware = "yes";
        width = "30";
        horizontal-pad = "20";
      };
    };
  };

  stylix.targets.fuzzel.enable = true;
}
