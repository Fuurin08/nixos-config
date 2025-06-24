{ ... }:

{
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    # amdgpu.amdvlk = {
    #   enable = true;
    #   support32Bit.enable = true;
    # };
  };

  hardware.amdgpu.opencl.enable = true;

  boot.initrd.kernelModules = [ "amdgpu" ];

  services.xserver.videoDrivers = [ "amdgpu" ];

}
