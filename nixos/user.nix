{
  pkgs,
  username,
  shell,
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
    ];
    shell = pkgs.${shell};
    initialPassword = "qwertz";
    openssh.authorizedKeys.keys = [ ];
  };
}
