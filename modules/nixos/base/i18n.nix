{
  pkgs,
  ...
}:

{
  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Use an NTP server located in the mainland of China to synchronize the system time
  networking.timeServers = [
    "ntp.aliyun.com" # Aliyun NTP Server
    "ntp.tencent.com" # Tencent NTP Server
  ];

  i18n = {
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5.waylandFrontend = true;
      fcitx5.addons = with pkgs; [
        fcitx5-configtool
        (fcitx5-rime.override {
          rimeDataPkgs = [
            rime-ice
          ];
        })
        fcitx5-chinese-addons
        fcitx5-mozc
        fcitx5-gtk
        catppuccin-fcitx5
      ];
    };
  };

  i18n = {
    defaultLocale = "C.UTF-8";
    extraLocales = [
      #"en_US.UTF-8/UTF-8"
      "zh_CN.UTF-8/UTF-8"
    ];
  };
}
