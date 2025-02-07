{
  pkgs,
  ...
}:
{
  imports = [
    ./git.nix
    ./nix.nix
  ];

  home.packages = with pkgs; [
  ];
}
