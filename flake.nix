{
  description = "Fuurin's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      # build with your own instance of nixpkgs
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, hyprland, ... }@inputs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = {
        snow = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/snow

            #home-manager.nixosModules.home-manager
            #{
            #  home-manager.useGlobalPkgs = true;
            #  home-manager.useUserPackages = true;
            ##  home-manager.extraSpecialArgs = { inherit user; };
            #  home-manager.users.fuurin = import ./home/fuurin.nix;
            #}
            hyprland.nixosModules.default
            { programs.hyprland.enable = true; }
          ];
        };
      };
      homeConfigurations = {
        #Desktop
	      "fuurin@snow" = home-manager.lib.homeManagerConfiguration {
	        pkgs = nixpkgs.legacyPackages."x86_64-linux";
	        #extraSpecialArgs = { inherit inputs outputs; };
	        modules = [
	          ./home/user/fuurin.nix
	        ];
        };
      };
    };
}
