{
  # shell command history
  programs.atuin = {
    enable = true;
    settings = {
      style = "full";
      invert = true;
    };
    enableBashIntegration = true;
    enableNushellIntegration = true;
  };
}
