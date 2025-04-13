{
  config,
  pkgs,
  nvidiaPackage,
  ...
}: {
  services.xserver.videoDrivers = ["nvidia"];

  hardware = {
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.${nvidiaPackage}; # TODO: make modular
    };
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        nvidia-vaapi-driver
        libvdpau-va-gl
      ];
    };
  };
  environment.systemPackages = with pkgs; [
    libva-utils
    nvtop-nvidia
    egl-wayland
    vdpauinfo
    vulkan-loader
    vulkan-tools
    vulkan-validation-layers
    # libglvnd
    # libGL
  ];

  boot.kernelParams = ["nvidia_drm.modeset=1" "nvidia.NVreg_PreserveVideoMemoryAllocations=1"];

  environment.variables = {
    GBM_BACKEND = "nvidia-drm";
    NVD_BACKEND = "direct";
    LIBVA_DRIVER_NAME = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
  };
}
