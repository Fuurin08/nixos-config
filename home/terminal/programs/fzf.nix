{
  programs.fzf = {
    enable = true;
    # defaultCommand = "";
    enableBashIntegration = true;
    defaultOptions = [
      "--walker-skip=dosdevices"
      "--layout=reverse"
      "--info=inline"
      "--preview='bat {}'"
      "--border=rounded"
      "--margin=1"
      "--padding=1"
    ];
  };
  stylix.targets.fzf.enable = true;
}
