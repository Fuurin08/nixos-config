{
  description = "My Nixos config";

  #nixConfig = {
  #  extra-substituters = [
  #
  #  ];
  #  extra-trusted-public-keys = [
  #
  #  ];
  #};

  inputs = {
    nixpkgs.url = "github:NixOs/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #nixvim-config.url = "github:Fuurin08/nixvim";
    nixvim.url = "github:dc-tec/nixvim";
    anyrun = {
      url = "github:Kirottu/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # ags.url = "github:Aylur/ags";
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
          let
            username = "fuurin";
            specialArgs = { inherit inputs; };
          in
          nixpkgs.lib.nixosSystem {
            inherit specialArgs;
            system = "x86_64-linux";

            modules = [
              inputs.auto-cpufreq.nixosModules.default

              ./hosts/snow

              home-manager.nixosModules.home-manager
              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  #backupFileExtension = "home-manager.backup";
                  extraSpecialArgs = { inherit inputs; };
                  users.${username} = import ./home/users/${username}.nix;
                };
              }
            ];
          };
      };
    };
}
