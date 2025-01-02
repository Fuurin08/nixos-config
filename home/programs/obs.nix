{
  pkgs,
  ...
}:

{
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      # screen capture
      wlrobs
    ];
  };
}
