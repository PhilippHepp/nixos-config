{config, ...}:

{
    time.timeZone = config.don.timezone;

    nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
