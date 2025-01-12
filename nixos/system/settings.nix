{config, ...}:

{
    services.xserver.xkb.layout = config.don.kb_layout;

    time.timeZone = config.don.timezone;

    nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
