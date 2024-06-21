{
  pkgs,
  ...
}:

{
  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
  };
  xdg.configFile."yazi/theme.toml".source = ./catppuccin-mocha.toml;
}