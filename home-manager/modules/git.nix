{ config, ...}: with config.don;

{
    programs.git = {
        enable = true;
        userName = username;
        userEmail = mail;
    };
}
