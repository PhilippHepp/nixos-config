{
  kb_layout,
  timezone,
  locales,
  ...
}:

let
  secondary = "${locales.main}";
in

{
  services.xserver.xkb.layout = kb_layout;

  time.timeZone = timezone;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  i18n.defaultLocale = "${locales.main}";
  i18n.extraLocaleSettings = {
    LC_MESSAGES = "${locales.main}";
    LC_ADDRESS = secondary;
    LC_IDENTIFICATION = secondary;
    LC_MEASUREMENT = secondary;
    LC_MONETARY = secondary;
    LC_NAME = secondary;
    LC_NUMERIC = secondary;
    LC_PAPER = secondary;
    LC_TELEPHONE = secondary;
    LC_TIME = secondary;
  };
  # console.keyMap = "de"
}
