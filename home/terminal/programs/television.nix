{
  programs.television = {
    enable = true;
    settings = {
      ui = {
        preview_panel = {
          size = 65;
        };
      };
    };
  };

  programs.nix-search-tv = {
    enable = true;
    enableTelevisionIntegration = true;
  };
}
