{
  description = "My Nixos config";

  inputs = {
    nixpkgs.url = "github:NixOs/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # hyprland = {
    #   url = "github:hyprwm/Hyprland";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    nixvim-config.url = "github:Fuurin08/nixvim";
    anyrun = {
      url = "github:Kirottu/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # ags.url = "github:Aylur/ags";
    niri.url = "github:sodiboo/niri-flake";
  };

  outputs = inputs@{
    self,
    nixpkgs,
    home-manager,
    # hyprland,
    nixvim-config,
    anyrun,
    # ags,
    niri,
    ...
  }: {
    nixosConfigurations = {
      snow = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          niri.nixosModules.niri
          ({pkgs, ...}: {
            programs.niri.enable = true;
            nixpkgs.overlays = [ inputs.niri.overlays.niri ];
            programs.niri.package = pkgs.niri-unstable;
          })

          ./hosts/laptop

          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = inputs;
              users.fuurin = {
                imports = [
                  ./home
                ];
              };
            };
          }
        ];
      };
    };
  };
}
