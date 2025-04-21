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
    ] ++ lib.mkIf config.virtualisation.docker.enable [ "docker" ];
    shell = pkgs.${shell};
    initialPassword = "qwertz";
    openssh.authorizedKeys.keys = [ ];
  };
}
