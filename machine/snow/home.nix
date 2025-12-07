{
  inputs,
  ...
}:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useUserPackages = true;
    backupFileExtension = "hm.backup";
    extraSpecialArgs = { inherit inputs; };
    users.fuurin = {
      imports = [
        ../../home/users/fuurin.nix
        # ../../home
      ];
    };
  };
}
