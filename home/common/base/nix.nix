{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    nix-output-monitor
    nvd
    nix-tree
    (pkgs.writeShellApplication {
      name = "ns";
      runtimeInputs = with pkgs; [
        fzf
        nix-search-tv
      ];
      text = builtins.readFile "${pkgs.nix-search-tv.src}/nixpkgs.sh";
      checkPhase = "true";
    })
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
