{
  ...
}:

{
  virtualisation = {
    docker.enable = false;
    podman = {
      enable = true;
      dockerCompat = true;
      autoPrune.enable = true;
      defaultNetwork.settings.dns_enabled = true;
    };
    oci-containers.backend = "podman";
  };
  #virtualisation.waydroid.enable = true;
}
