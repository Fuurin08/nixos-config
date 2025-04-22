{
  pkgs,
  ...
}:

{
  imports = [
    ./firefox.nix
    ./zen-browser.nix
  ];

  home.packages = with pkgs; [
    ungoogled-chromium
  ];
}
