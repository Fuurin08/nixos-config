{
  config,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    # nix
    nixd
    nixfmt-rfc-style # nix formatter

    # rust
    rust-analyzer
  ];
}
