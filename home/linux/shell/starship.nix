{
  config,
  ...
}:

{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    # enableZshIntegration = true;
    enableNushellIntegration = true;

    settings = {
      character = {
        success_symbol = "[>](bold blue)";
        error_symbol = "[>](bold red)";
      };
    };
  };
  # home.file."${config.xdg.configHome}/starship.toml".source = ./starship.toml;
}