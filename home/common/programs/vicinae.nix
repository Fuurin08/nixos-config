{
  ...
}:

{
  programs.vicinae = {
    enable = true;
    systemd = {
      enable = true;
      autoStart = true;
    };

    settings = {
      theme.name = "catppuccin-mocha";

      faviconService = "twenty"; # twenty | google | none
      font.size = 11;
      popToRootOnClose = false;
      rootSearch.searchFiles = false;
      window = {
        csd = true;
        opacity = 0.95;
        rounding = 10;
      };
    };
    # extensions = [

    # ];
  };
}
