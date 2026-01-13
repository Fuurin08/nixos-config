{
  config,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    # nix
    nixd
    nixfmt # nix formatter

    # rust
    # rust-analyzer
  ];
}
