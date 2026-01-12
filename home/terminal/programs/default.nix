{
  pkgs,
  ...
}:

{
  imports = [
    ./btop.nix
    ./yazi.nix
    ./zellij.nix
    ./bat.nix

    # fuzzy search
    ./fzf.nix
    ./television.nix

    ./atuin.nix
    ./zoxide.nix
    ./carapace.nix
    ./direnv.nix
  ];

  home.packages = with pkgs; [
    fd
    binsider
    impala
  ];
}
