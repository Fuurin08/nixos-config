{
  auto-cpufreq,
  ...
}:

{
  programs.auto-cpufreq.enable = true;

  programs.auto-cpufreq.settings = {
    charger = {
      governor = "performance";
      turbo = "auto";
    };
    
    battery = {
      governor = "powersave";
      turbo = "auto";
      enable_thresholds = true;
      start_threshold = "20";
      stop_threshold = "90";
    };
  };
}
