{
  inputs,
  ...
}:

{
  imports = [
    inputs.vicinae.homeManagerModules.default
  ];

  services.vicinae = {
    enable = true; # default: false
    autoStart = true; # default: true
    # package = # specify package to use here. Can be omitted.
    settings = {
      faviconService = "twenty"; # twenty | google | none
      font.size = 11;
      popToRootOnClose = false;
      rootSearch.searchFiles = false;
      theme.name = "catppuccin-mocha";
      window = {
        csd = true;
        opacity = 0.95;
        rounding = 10;
      };
    };
  };
}
