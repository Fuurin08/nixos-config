{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    shellAliases = {

    };

    #loginExtra = ''
    #  # If running from tty1 start hyprland
    #  [ "$(tty)" = "/dev/tty1" ] && exec dbus-run-session Hyprland
    #'';

    envExtra = "";

    initExtra = "";

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

    #enableAutosuggestions = true;
    #enableCompletion = true;
    #enableSyntaxHighlighting = true;

    #autocd = true;

    #completionInit = "";
    dotDir = ".config/zsh";

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
        "prompt"
      ];
      prompt.theme = "paradox";
    };
  };
}
