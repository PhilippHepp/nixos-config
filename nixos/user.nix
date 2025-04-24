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
    ] ++ [ "docker" ];
    shell = pkgs.${shell};
    initialPassword = "qwertz";
    openssh.authorizedKeys.keys = [ ];
  };
  nix.settings.trusted-users = [
    "root"
    "${username}"
  ];
  nix.extraOptions = ''
    extra-substituters = https://devenv.cachix.org
    extra-trusted-public-keys = devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=
  '';
}
