{
  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
    settings = {
      mgr = {
        show_hidden = true;
        sort_dir_first = true;
      };
    };
  };

  stylix.targets.yazi.enable = true;
}
