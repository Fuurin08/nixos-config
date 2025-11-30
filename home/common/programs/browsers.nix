{
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    # zen-browser
    inputs.zen-browser.homeModules.twilight
    # or inputs.zen-browser.homeModules.twilight-official
    # or inputs.zen-browser.homeModules.beta
  ];

  programs.chromium = {
    enable = true;

    # package = pkgs.brave;

    commandLineArgs = [
      #From: https://wiki.archlinuxcn.org/wiki/Chromium
      # web features
      "--enable-experimental-web-platform-features"

      # video acceleration
      "--enable-features=AcceleratedVideoDecodeLinuxGL"
    ];
  };

  programs.firefox = {
    enable = true;
  };

  programs.zen-browser = {
    enable = true;
    policies = {
      # find more options here: https://mozilla.github.io/policy-templates/
      DisableAppUpdate = true;
      DisableTelemetry = true;
      DisablePocket = true;
      AutofillAddressEnabled = true;
      AutofillCreditCardEnabled = false;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      PromptForDownloadLocation = true; # Ask where to save each file before downloading.
    };
  };
}
