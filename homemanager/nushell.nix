{ pkgs }:
{
  programs.nushell = {
    enable = true;
    plugins = with pkgs.nushellPlugins; [
      dbus
      skim
      formats
      gstat
      highlight
      net
      query
      units
    ];
  };
}
