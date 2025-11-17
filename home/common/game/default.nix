{
  pkgs,
  osConfig,
  ...
}:

{
  home.packages = with pkgs; [
    #A Vulkan and OpenGL overlay for monitoring FPS, temperatures, CPU/GPU load and more.
    mangohud

    # Lossless Scaling
    lsfg-vk
    lsfg-vk-ui

    # MineCraft launcher
    prismlauncher
  ];

  programs.lutris = {
    enable = true;
    steamPackage = osConfig.programs.steam.package;
    defaultWinePackage = pkgs.proton-ge-bin;
    protonPackages = [ pkgs.proton-ge-bin ];
    winePackages = with pkgs; [
      wineWow64Packages.full
      wineWowPackages.stagingFull
    ];
    extraPackages = with pkgs; [
      winetricks
      mangohud
      gamescope
      gamemode
    ];
  };
}
