{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    shellAliases = {

    };

    history = {
      extended = true;
      ignoreDups = true;
      path = "$HOME/.zsh_history";
      save = 2000;
      size = 10000;
      share = true;
    };
    historySubstringSearch = {
      enable = true;
      searchDownKey = "^[[B";
      searchUpKey = "^[[A";
    };

    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;

    #autocd = true;

    #completionInit = "";

    dotDir = ".config/zsh";

    envExtra = "";

    initExtra = "";

  };
}
