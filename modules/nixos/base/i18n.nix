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
    defaultLocale = "C.UTF-8";
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5.waylandFrontend = true;
      fcitx5.addons = [
        pkgs.fcitx5-configtool
        pkgs.fcitx5-rime
        pkgs.fcitx5-chinese-addons
        pkgs.fcitx5-mozc
        pkgs.fcitx5-gtk
      ];
    };
  };

}
