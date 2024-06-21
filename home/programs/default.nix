{
  config,
  ...
}:

{
  imports = [
    ./git.nix
    ./fcitx5
    ./firefox
    ./btop.nix
    ./yazi
  ];
}