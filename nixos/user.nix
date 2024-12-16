{pkgs, username, ...}:

{
    users.users.${username} = {
        isNormalUser = true;
        description = username;
        extraGroups = ["networkmanager" "wheel" "input" "audio" ];
        shell = pkgs.zsh;
    };
}
