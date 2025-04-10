{pkgs, lib, ...}:

{
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;

      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      # jack.enable = true;
      wireplumber.enable = true;
    };
    environment.systemPackages = with pkgs; [
        pavucontrol
        pamixer
	alsa-utils
	pulsemixer
    ];
}
