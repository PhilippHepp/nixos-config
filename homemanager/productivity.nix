{
  pkgs,
  email,
  ...
}:
{
  home.packages = with pkgs; [
    obsidian
    zeal
    toipe
  ];

  programs.rbw = {
    enable = true;
    settings = {
      email = "philipp.hepp@protonmail.com";
      base_url = "https://vault.bitwarden.eu/";
      pinentry = pkgs.pinentry-rofi;
    };
  };
}
