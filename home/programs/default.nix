{
  config,
  ...
}:

{
  imports = [
    ./git.nix
    ./fcitx5
    ./firefox
    ./editors
  ];
}