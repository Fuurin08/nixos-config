{
  pkgs,
  ...
}:

{
  # home.packages = with pkgs; [
  #   fish
  # ];

  programs.nushell = {
    enable = true;
    # extraConfig = ''
    #   let fish_completer = {|spans|
    #       fish --command $'complete "--do-complete=($spans | str join " ")"'
    #       | from tsv --flexible --noheaders --no-infer
    #       | rename value description
    #   }
    # '';
  };
}
