{ username, mail, ...}: 

{
    programs.git = {
        enable = true;
        userName = username;
        userEmail = mail;
    };
}
