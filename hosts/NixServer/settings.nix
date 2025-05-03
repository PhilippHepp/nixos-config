rec {
  hostname = "nixserver";
  system = "x86_64-linux";
  timezone = "Europe/Berlin";

  username = "admin";
  email = "philipp.hepp7@gmail.com";
  shell = "zsh";

  dotfiles = "/home/${username}/.config";

  userSSHKeys = [
  ];

  locales = {
    main = "en_US.UTF-8";
    extra = "de_DE.UTF-8";
  };

  mydrive = "/dev/nvme0n1";
  swapSize = "16G";
  kb_layout = "de";
  monitor = [
  ];

  nvidiaPackage = "latest";

  shellPrompt = "";
}
