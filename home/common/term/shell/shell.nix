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

  # shell command history
  programs.atuin = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
    enableFishIntegration = true;
  };

  # cat with syntax highlight
  programs.bat = {
    enable = true;
  };

  # Command argument completion generator
  programs.carapace = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
    enableFishIntegration = true;
  };

  # A smarter cd command
  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
    enableFishIntegration = true;
  };
}
