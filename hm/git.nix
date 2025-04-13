{
  username,
  mail,
  ...
}: {
  programs.git = {
    enable = true;
    userName = username;
    userEmail = mail;
  };
  programs.lazygit = {
    enable = true;
    # settings = {
    #     gui.theme = {
    #
    #     };
    # };
  };
}
