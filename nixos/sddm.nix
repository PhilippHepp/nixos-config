{dotfiles, ...}:

{
    services.displayManager = {
        enable = true;
        sddm = {
            enable = true;
            wayland.enable = true;
            theme = "Elegant";
            # settings = {
            #     Theme = {
            #         FacesDir = "${dotfiles}/sddm/faces";
            #     };
            # };
        };
    };
}
