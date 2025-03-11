{
  #config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.nvim-nixcats.homeModule
  ];
  home.packages = with pkgs; [
    inputs.nvim-nixcats.packages.${pkgs.system}.default
    neovide
  ];
}
