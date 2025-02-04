{
  pkgs,
  ...
}:

{
  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
    settings = {
      manager = {
        show_hidden = true;
        sort_dir_first = true;
      };
    };
  };

  #xdg.configFile."yazi/theme.toml".source = ./catppuccin-mocha.toml;
}
