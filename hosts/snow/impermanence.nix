{
  inputs,
  ...
}:

{
  imports = [
    inputs.impermanence.nixosModules.impermanence
  ];

  environment.persistence."/persist" = {
    enable = true;
    hideMounts = true;

    directories = [
      "/var/lib"
      "/var/log"
    ];
    files = [
      "/etc/machine-id"
    ];

    # preserve user-specific files, implies ownership
    users.fuurin = {
      directories = [
        "Documents"
        "Downloads"
        "Music"
        "Pictures"
        "Videos"
        {
          directory = ".ssh";
          mode = "0700";
        }
        {
          directory = ".gnupg";
          mode = "0700";
        }

        ".local/state/nix"
        ".local/state"
        ".local/share"

        ".config"
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
}
