{
  pkgs,
  ...
}:

{
  fonts = {
    enableDefaultPackages = false;
    packages = with pkgs; [
      # emoji
      noto-fonts-color-emoji

      # sans(serif) font
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      wqy_zenhei
      wqy_microhei

      # monospace fonts
      jetbrains-mono

      # nerd fonts
      nerd-fonts.jetbrains-mono
      nerd-fonts.symbols-only
    ];

    # user defined fonts
    fontconfig.defaultFonts = {
      serif = [
        "Noto Serif"
        "Noto Serif CJK SC"
      ];
      sansSerif = [
        "Noto Sans"
        "Noto Sans CJK SC"
      ];
      monospace = [ "JetBrains Mono Nerd Font" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
