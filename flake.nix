{
  description = "My Nixos config";

  inputs = {
    nixpkgs.url = "github:NixOs/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    anyrun = {
      url = "github:Kirottu/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags.url = "github:Aylur/ags";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    hyprland,
    anyrun,
    ags,
    ...
    }@inputs: 
    let
      system = "x86_64-linux";
    in
  {
    nixosConfigurations = {
      snow = nixpkgs.lib.nixosSystem {
        # inherit system;
        # specialArgs = { inherit inputs; };
        modules = [
          ./hosts/laptop
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs system; };
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
