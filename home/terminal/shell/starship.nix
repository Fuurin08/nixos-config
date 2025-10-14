{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;

    settings = {
      character = {
        success_symbol = "[>](bold blue)";
        error_symbol = "[>](bold red)";
      };
    };
  };
}
