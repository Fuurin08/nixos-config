{
  pkgs,
  ...
}:

{
  imports = [
    ./nix.nix
  ];

  environment.systemPackages = with pkgs; [
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    git
    fastfetch
    just

    gcc
    #wlroots
    ripgrep
    fzf

    #network tools
    wget
    curl
    aria2
  ];

  environment.variables.EDITOR = "nvim";
}
