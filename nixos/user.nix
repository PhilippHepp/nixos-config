{
  pkgs,
  username,
  shell,
  ...
}: {
  users.users.${username} = {
    isNormalUser = true;
    description = username;
    extraGroups = ["networkmanager" "wheel" "input" "audio" "video"];
    shell = pkgs.${shell};
    initialPassword = "Changeme";
    openssh.authorizedKeys.keys = [];
  };
}
