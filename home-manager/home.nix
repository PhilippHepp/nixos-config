{ config, pkgs, ... }: {
	home = {
		username = "donielmaker";
		homeDirectory = "/home/donielmaker";
		stateVersion = "24.05";
	};

	programs.neovim = {
		enable = true;
		defaultEditor = true;
	};

	programs.gh = {
		enable = true;
		gitCredentialHelper.enable = true;
		gitCredentialHelper.hosts = [
			"https://github.com"
		];
	};

# programs.zsh = {
#     enable = true;
#     enableCompletion = true;
#     autosuggestion.enable = true;
#     dotDir = ".config/zsh";
#     plugins = [
#         {
#             name = "oh-my-posh";
#             src = pkgs.fetchFromGitHub {
#                 owner = "JanDeDobbeleer";
#                 repo = "oh-my-posh";
#                 rev = "v23.3.0";
#             };
#         }
#     ];
# };

	programs.git = {
		enable = true;
		userName = "donielmaker";
		userEmail = "daniel.schmidt0204@gmail.com";
	};
		       }
