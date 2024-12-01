{ config, ... }: 

{
    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = { 
        # Enables Kernel Modesetting. Fixes Screen Tearing when using Optimus
        modesetting.enable = true;

        # Disables Power Mangement through Systemd
        powerManagement.enable = false;
        powerManagement.finegrained = false;

        # Disables Open Source Driver
        open = false;

        # Enables the Nvidia X Server Settings
        nvidiaSettings = true;

        # The Package of the Nvidia Driver
        package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
}

