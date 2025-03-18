{ username, lib, ... }:

{
    home = {
        inherit username;
        homeDirectory = lib.mkForce "/home/${username}";
        stateVersion = "24.05";
    };
}
