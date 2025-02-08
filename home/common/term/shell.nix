{
  pkgs,
  config,
  ...
}:

{
  home.packages = with pkgs; [
    fish
    fzf
  ];

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  programs.nushell = {
    enable = true;
    extraConfig = ''
      let fish_completer = {|spans|
          fish --command $'complete "--do-complete=($spans | str join " ")"'
          | from tsv --flexible --noheaders --no-infer
          | rename value description
      }
    '';
  };

  programs.btop = {
    enable = true;
    settings = {
      # color_theme = "catppuccin_mocha";
      theme_background = false;
    };
  };

  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
    settings = {
      manager = {
        show_hidden = true;
        sort_dir_first = true;
      };
    };
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

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
    enableFishIntegration = true;

    settings = {
      character = {
        success_symbol = "[>](bold blue)";
        error_symbol = "[>](bold red)";
      };
    };
  };
}
