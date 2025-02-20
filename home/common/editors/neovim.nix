{
  #config,
  pkgs,
  #nixvim-config,
  inputs,
  ...
}:

{
  #imports = [
  #  nixvim.packages.${pkgs.system}.default
  #];
  home.packages = with pkgs; [
    #nixvim-config.packages.${pkgs.system}.default
    #inputs.nixvim.packages.${pkgs.system}.default # https://github.com/niksingh710/nvix
    neovide
  ];
  programs.neovim = {
    enable = true;
    #package = pkgs.neovim-unwrapped;  # 使用 neovim-unwrapped
  };
}
