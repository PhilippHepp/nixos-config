{
  pkgs,
  username,
  shell,
  lib,
  config,
  ...
}:
{
  users.users.${username} = {
    isNormalUser = true;
    description = username;
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
      "input"
      "video"
      "docker"
    ];
    shell = pkgs.${shell};
    initialPassword = "qwertz";
    openssh.authorizedKeys.keys = [ ];
  };
  nix.settings.trusted-users = [
    "root"
    "${username}"
  ];
}
