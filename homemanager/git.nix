{
  username,
  email,
  ...
}:
{
  programs.git = {
    enable = true;
    userName = "LSTR-261";
    userEmail = "lstr-261@proton.me";
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
