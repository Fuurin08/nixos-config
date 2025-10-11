{
  description = "My Nixos config";

  nixConfig = {
    extra-substituters = [
      "https://anyrun.cachix.org"
    ];
    extra-trusted-public-keys = [
      "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
    ];
  };

  inputs = {
    nixpkgs.url = "github:NixOs/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    preservation.url = "github:nix-community/preservation";

    devsehll = {
      url = "github:numtide/devshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    anyrun = {
      url = "github:anyrun-org/anyrun";
      # inputs.nixpkgs.follows = "nixpkgs";
    };

    wallpapers = {
      url = "github:Fuurin08/wallpapers";
      flake = false;
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      ...
    }:
    {
      nixosConfigurations = {
        snow =
          # let
          #   specialArgs = { inherit inputs; };
          # in
          nixpkgs.lib.nixosSystem {
            specialArgs = { inherit inputs; };
            # inherit specialArgs;
            system = "x86_64-linux";

            modules = [

              ./hosts/snow

              home-manager.nixosModules.home-manager
              {
                home-manager = {
                  useUserPackages = true;
                  backupFileExtension = "home-manager.backup";
                  extraSpecialArgs = { inherit inputs; };
                  users.fuurin = import ./home/users/fuurin.nix;
                };
              }
            ];
          };
      };
      templates = import ./templates;
    };
}
