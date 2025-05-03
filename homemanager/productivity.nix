{
  pkgs,
  email,
  ...
}: {
  home.packages = with pkgs; [
    obsidian
    zeal
    toipe
  ];

  programs.rbw = {
    enable = true;
    settings = {
      inherit email;
    };
  };
}
