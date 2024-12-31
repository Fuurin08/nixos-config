{
  ...
}:

{
  # Set allow unfree software
  nixpkgs.config.allowUnfree = true;

  #nix.gc = {
  #  automatic =  true;
  #  dates =  "weekly";
  #  options = "--delete-older-than 7d";
  #};

  # Manual optimise storage: nix-store --optimise
  # https://nixos.org/manual/nix/stable/command-ref/conf-file.html#conf-auto-optimise-store
  nix.settings.auto-optimise-store = true;

  nix.channel.enable = false;
}
