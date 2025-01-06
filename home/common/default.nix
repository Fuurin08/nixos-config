{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    nix-output-monitor
    nix-tree
  ];

  imports = [

  ];
}
