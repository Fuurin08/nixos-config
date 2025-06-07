# https://github.com/ryan4yin/nix-config/blob/10924e67e1183102ea1f30c8f886068ae820c0fc/modules/nixos/desktop/game/steam.nix
{
  pkgs,
  ...
}:

{
  # Launching gamescope from Steam, stuttering after ~24 minutes (Gamescope Lag Bomb)
  # Adding the following to the games launch options
  # For example: LD_PRELOAD="" gamescope -- %command%
  # From: https://github.com/ValveSoftware/gamescope/issues/163#issuecomment-2818354875

  # Steam game launch options
  # For example: LD_PRELOAD="" gamescope -w 1920 -h 1080 -W 1920 -H 1080 -r 120  -- mangohud gamemoderun %command%
 
  programs.steam = {
    # Some location that should be persistent:
    #   ~/.local/share/Steam - The default Steam install location
    #   ~/.local/share/Steam/steamapps/common - The default Game install location
    #   ~/.steam/root        - A symlink to ~/.local/share/Steam
    #   ~/.steam             - Some Symlinks & user info
    enable = true;

    gamescopeSession.enable = true;
    # fix gamescope inside steam
    package = pkgs.steam.override {
      extraPkgs = pkgs:
        with pkgs; [
          xorg.libXcursor
          xorg.libXi
          xorg.libXinerama
          xorg.libXScrnSaver
          libpng
          libpulseaudio
          libvorbis
          stdenv.cc.cc.lib
          libkrb5
          keyutils        
        ];
    };
    fontPackages = with pkgs; [
      # Steam chinese font
      wqy_zenhei
    ];
  };
}
