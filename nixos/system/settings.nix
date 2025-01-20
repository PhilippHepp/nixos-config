{kb_layout, timezone, ...}:

{
    services.xserver.xkb.layout = kb_layout;

    time.timeZone = timezone;

    nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
