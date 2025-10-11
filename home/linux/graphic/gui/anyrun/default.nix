{
  pkgs,
  inputs,
  ...
}:

{

  imports = [
    (
      { modulesPath, ... }:
      {
        # Important! We disable home-manager's module to avoid option
        # definition collisions
        disabledModules = [ "${modulesPath}/programs/anyrun.nix" ];
      }
    )
    inputs.anyrun.homeManagerModules.default
  ];

  programs.anyrun = {
    enable = true;
    package = inputs.anyrun.packages.${pkgs.system}.anyrun;
    config = {
      x.fraction = 0.5;
      y.fraction = 0.2;
      width.fraction = 0.3;

      hideIcons = false;
      ignoreExclusiveZones = false;
      layer = "overlay";
      hidePluginInfo = false;
      closeOnClick = true;
      showResultsImmediately = true;
      maxEntries = null;

      plugins = [
        "${pkgs.anyrun}/lib/libapplications.so"
        # "${pkgs.anyrun}/lib/libsymbols.so"
        "${pkgs.anyrun}/lib/librink.so"
        "${pkgs.anyrun}/lib/libshell.so"
        "${pkgs.anyrun}/lib/libwebsearch.so"
        "${pkgs.anyrun}/lib/libniri_focus.so"
      ];
    };

    extraConfigFiles = {
      "applications.ron".text = # ron
        ''
          Config(
            // Also show the Desktop Actions defined in the desktop files, e.g. "New Window" from LibreWolf
            desktop_actions: true,

            max_entries: 5,

            // The terminal used for running terminal based desktop entries, if left as `None` a static list of terminals is used
            // to determine what terminal to use.
            terminal: Some(Terminal(
              // The main terminal command
              command: "kitty",
              // What arguments should be passed to the terminal process to run the command correctly
              // {} is replaced with the command in the desktop entry
              args: "-e {}",
            )),
          )
        '';
      "symbols.ron".text = # ron
        ''
          Config(
            // The prefix that the search needs to begin with to yield symbol results
            prefix: "",
            // Custom user defined symbols to be included along the unicode symbols
            symbols: {
              // "name": "text to be copied"
              "shrug": "¯\\_(ツ)_/¯",
            },
            max_entries: 3,
          )
        '';
    };
  };
  xdg.configFile."anyrun/style.css".source = ./style.css;
}
