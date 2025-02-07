{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    nix-output-monitor
    nvd
    nix-tree
  ];

  programs.nh = {
    enable = true;
    flake = "/home/fuurin/nixos-config";
    clean = {
      enable = true;
      extraArgs = "--keep-since 7d";
    };
  };
}
