{
  pkgs,
  ...
}:

{
  fonts = {
    packages = with pkgs; [
      wqy_zenhei
      nerd-fonts.jetbrains-mono
    ];
  };
}
