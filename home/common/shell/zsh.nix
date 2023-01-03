{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    shellAliases = {

    };

    history = {
      extended = true;
      ignoreDups = true;
      path = "$HOME/.config/zsh/.zsh_history";
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

    prezto = {
      enable = true;

      caseSensitive = true;
      historySubstring = {
        foundColor = "fg=blue";
        notFoundColor = "fg=red";
      };
      color = true;
      editor = {
        keymap = "emacs";
        promptContext = true;
      };
      pmodules = [
        "syntax-highlighting"
        "history-substring-search"
        "autosuggestions"
        "completion"
        "tmux"
        "prompt"
      ];
      prompt.theme = "paradox";

      tmux = {
        autoStartLocal = true;
        defaultSessionName = "ss";
      };
    };
  };
  home.packages = with pkgs; [
    tmux
  ];
}
