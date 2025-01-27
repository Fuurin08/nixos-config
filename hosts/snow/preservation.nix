{
  inputs,
  ...
}:

{
  imports = [
    inputs.preservation.nixosModules.preservation
    #inputs.impermanence.nixModules.impermanence
  ];

  preservation = {
    enable = true;

    preserveAt."/persist" = {
      directories = [
        "/var/lib"
        "/var/log"
      ];
      files = [
        {
          file = "/etc/machine-id";
          inInitrd = true;
        }
      ];

      # preserve user-specific files, implies ownership
      users.fuurin = {
        directories = [
          {
            directory = ".ssh";
            mode = "0700";
          }
          {
            directory = ".gnupg";
            mode = "0700";
          }

          "Desktop"
          "Documents"
          "Downloads"
          "Music"
          "Pictures"
          "Videos"

          ".local/state/nix"
          ".config"
          ".local"
          ".cache"
          ".cargo"

          "nixos"
          "nixos-config"

          # browsers
          ".mozilla"

          # editor
          ".emacs.d"

          # steam
          ".local/share/Steam"
          ".steam"
        ];
        files = [
          ".bash_history"
        ];
      };
    };
  };

  # systemd-machine-id-commit.service would fail, but it is not relevant
  # in this specific setup for a persistent machine-id so we disable it
  #
  # see the firstboot example below for an alternative approach
  systemd.suppressedSystemUnits = [ "systemd-machine-id-commit.service" ];
}
