{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    # Lossless Scaling
    lsfg-vk
    lsfg-vk-ui

    # MineCraft launcher
    prismlauncher
  ];
}
