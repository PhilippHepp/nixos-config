{pkgs, ...}: 

{
    programs.rofi.enable =  true;
    programs.rofi = {
        terminal = "${pkgs.kitty}/bin/kitty";
        theme = "";
    };

}
