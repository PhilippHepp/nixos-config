{pkgs, username, ...}:

{
    users.users.${username} = {
        isNormalUser = true;
        description = username;
        extraGroups = ["networkmanager" "wheel" "input" "audio" "video" ];
        shell = pkgs.zsh;
        initialPassword = "Changeme";
        openssh.authorizedKeys.keys = [];
    };
}
