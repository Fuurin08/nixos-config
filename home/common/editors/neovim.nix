{
  #config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
  ];
  home.packages = with pkgs; [
    neovim
    neovide
  ];
}
