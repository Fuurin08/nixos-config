{
  inputs,
  ...
}:

{
  imports = [
    # zen-browser
    # inputs.zen-browser.homeModules.twilight
    # or inputs.zen-browser.homeModules.twilight-official
    inputs.zen-browser.homeModules.beta
  ];

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
    profiles = {
      "default" = {
        isDefault = true;

      };
    };
  };

  stylix.targets.zen-browser = {
    enable = true;
    profileNames = [ "default" ];
  };
}
