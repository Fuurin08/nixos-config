{
  pkgs,
  config,
  ...
}:

{
  home.packages = with pkgs; [
    fish
  ];

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  programs.nushell = {
    enable = true;
    #configFile.source = ./config.nu;
    extraConfig = ''
      let fish_completer = {|spans|
          fish --command $'complete "--do-complete=($spans | str join " ")"'
          | from tsv --flexible --noheaders --no-infer
          | rename value description
      }
    '';
  };

  programs.atuin = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
  };

  programs.bat = {
    enable = true;
  };

  programs.carapace = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
  };
}
