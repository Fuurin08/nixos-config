{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    powertop
  ];

  services.upower.enable = true;

  # https://linrunner.de/tlp/index.html
  services.tlp = {
    enable = true;
    settings = {
      # AMD CPU scaling(active mode)
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      # AMD CPU energy/performance policies
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";

      # AMD CPU Boost
      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;

      # Platform profile
      PLATFORM_PROFILE_ON_AC = "performance";
      PLATFORM_PROFILE_ON_BAT = "low_power";

      # AMD GPU Power management
      RADEON_DPM_PERF_LEVEL_ON_AC = "auto";
      RADEON_DPM_PERF_LEVEL_ON_BAT = "low";

      # Battery charge level below which charging will begin.
      START_CHARGE_THRESH_BAT0 = 0;
      # Battery charge level above which charging will stop.
      STOP_CHARGE_THRESH_BAT0 = 1;
    };
  };
}
