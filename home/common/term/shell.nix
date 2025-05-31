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
    extraConfig = ''
      let fish_completer = {|spans|
          fish --command $'complete "--do-complete=($spans | str join " ")"'
          | from tsv --flexible --noheaders --no-infer
          | rename value description
      }
    '';
  };

  programs.zellij = {
    enable = true;
    settings = {
      default_shell = "nu";
    };
  };

  programs.fzf = {
    enable = true;
    defaultOptions = [
      "--height 60%"
      "--layout reverse"
      "--border"
    ];
    enableBashIntegration = true;
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
      mgr = {
        show_hidden = true;
        sort_dir_first = true;
      };
    };
  };

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

  # cat with syntax highlight
  programs.bat = {
    enable = true;
  };

  # Command argument completion generator
  programs.carapace = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
  };

  # A smarter cd command
  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
  };

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
