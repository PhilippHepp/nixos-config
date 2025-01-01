{ config, ...}: 

{
    programs.git = {
        enable = true;
        userName = config.don.username;
        userEmail = config.don.mail;
    };
}
