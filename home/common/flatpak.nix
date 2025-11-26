{
  inputs,
  ...
}:

{
  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
  ];

  services.flatpak = {
    enable = true;
    remotes = [
      {
        name = "flathub";
        location = "https://mirror.sjtu.edu.cn/flathub";
      }
    ];
    packages = [
      {
        appId = "cn.ottercorp.xivlaunchercn";
        origin = "flathub";
      }
      "com.qq.QQ"
      # "com.obsproject.Studio"
      # "im.riot.Riot"
      # {
      #   appId = "cn.ottercorp.xivlaunchercn";
      #   origin = "flathub";
      # }
    ];
  };
}
