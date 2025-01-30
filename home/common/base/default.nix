{
  pkgs,
  ...
}:
{
  imports = [
    ./git.nix
  ];

  home.packages = with pkgs; [
    nix-output-monitor
    nix-tree

    nh
    nvd
  ];
}
