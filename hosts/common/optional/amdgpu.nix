{ pkgs , ... }:

{
  boot.initrd.kernelModules = [ "amdgpu" ];

  services.xserver.videoDrivers = [ "amdgpu" ];

  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        amdvlk
        rocm-opencl-icd
        rocm-opencl-runtime
      ];
      extraPackages32 = with pkgs; [
        driversi686Linux.amdvlk
      ];
    };
  };
  
  environment.systemPackages = with pkgs; [
    mesa
    opencl-info
    glxinfo

    radeontop
  ];
}
