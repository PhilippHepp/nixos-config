{pkgs, inputs, ...}: 

{
    programs.rofi = {
        enable = true;
	terminal = "${pkgs.kitty}/bin/kitty";
	extraConfig = {
	    modi = "drun,calc";
	};
	plugins = with pkgs; [
	    rofi-calc
	];
	location = "center";
	theme = "arthur";
        # theme = "${inputs.self.packages."x86_64-linux".rofi-catppuccin}/catppuccin-macchiato.rasi";
        # theme = "${inputs.self.packages."x86_64-linux".rofi-spotlight}/spotlight-dark.rasi";
    };
    home.packages = [pkgs.libqalculate];
}
