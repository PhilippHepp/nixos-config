{
    programs.alacritty = {
        enable = true;
        settings = {
            # general_import = ["./themes/tokyo_night_storm.toml"];
            import = ["./alacritty-themes/tokyo_night_storm.toml"];

            window = {
                opacity = 0.8;
                blur = true;
                decorations = "None";
                padding = { x = 10; y = 10; };
            };

            font.normal.family = "FiraCode Nerd Font";
            font.size = 12;
        };
    };
}
