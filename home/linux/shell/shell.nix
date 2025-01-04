{
  config,
  ...
}:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  programs.nushell = {
    enable = true;
    #configFile.source = ./config.nu;
    extraConfig = ''
      # auto start zellij
      # except when in emacs or zellij itself
      if (not ("ZELLIJ" in $env)) and (not ("INSIDE_EMACS" in $env)) {
        if "ZELLIJ_AUTO_ATTACH" in $env and $env.ZELLIJ_AUTO_ATTACH == "true" {
          ^zellij attach -c
        } else {
          ^zellij
        }

        # Auto exit the shell session when zellij exit
        $env.ZELLIJ_AUTO_EXIT = "false" # disable auto exit
        if "ZELLIJ_AUTO_EXIT" in $env and $env.ZELLIJ_AUTO_EXIT == "true" {
          exit
        }
      }
    '';
  };

  programs.carapace = {
    enable = true;
    enableNushellIntegration = true;
  };
}
