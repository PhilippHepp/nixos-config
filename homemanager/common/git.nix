{
  username,
  email,
  ...
}: {
  programs.git = {
    enable = true;
    userName = username;
    userEmail = email;
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
