{
    programs.oh-my-posh = {
        enable = true;
        enableZshIntegration = true;
        settings = {
            version = 2;
            final_space = true;
            console_title_template = "I use NixOS btw";
            blocks = [
                {
                    type = "rprompt";
                    overflow = "hidden";
                    segments = [
                        {
                            type = "executiontime";
                            style = "plain";
                            foreground = "p:yellow";
                            background = "transparent";
                            properties.style = "roundrock";
                        }
                        {
                            type = "os";
                            style = "plain";
                            foreground = "p:blue";
                            background = "transparent";
                            template = " {{if .WSL}} I use {{ .Icon }}  btw {{ end }}";
                        }
                    ];
                }
                {
                    type = "prompt";
                    alignment = "left";
                    newline = true;
                    segments = [
                        {
                            type = "session";
                            style = "diamond";
                            trailing_diamond = "";
                            foreground = "p:white";
                            background = "p:grey";
                            template = " {{ if .SSHSession}} {{ end}}{{ .UserName}}";
                        } 
                        {
                            type = "path";
                            style = "diamond";
                            leading_diamond = "";
                            trailing_diamond = "";
                            foreground = "p:white";
                            background = "p:dark_blue"; 
                            template = "  {{ path .Path .Location}} ";
                            properties.style = "full";
                        }
                        {
                            type = "git";
                            style = "diamond";
                            leading_diamond = "";
                            trailing_diamond = "";
                            foreground = "p:black";
                            foreground_templates = [
                                "{{ if or (.Working.Changed) (.Staging.Changed) }}p:black{{ end }}"
                                "{{ if and (gt .Ahead 0) (gt .Behind 0) }}p:white{{ end }}"
                                "{{ if gt .Ahead 0 }}p:white{{ end }}"
                            ];
                            background = "p:orange";
                            background_templates = [
                                "{{ if or (.Working.Changed) (.Staging.Changed) }}p:yellow{{ end }}"
                                "{{ if and (gt .Ahead 0) (gt .Behind 0) }}p:red{{ end }}"
                                "{{ if gt .Ahead 0 }}#49416D{{ end }}"
                                "{{ if gt .Behind 0 }}#7A306C{{ end }}"
                            ];
                            template = " {{ if .UpstreamURL }}{{ url .UpstreamIcon .UpstreamURL }} {{ end }}{{ .HEAD }}{{if .BranchStatus }} {{ .BranchStatus }}{{ end }}{{ if .Working.Changed }}  {{ .Working.String }}{{ end }}{{ if .Staging.Changed }}  {{ .Staging.String }}{{ end }} ";
                            properties = {
                                branch_max_length = 25;
                                fetch_status = true;
                                fetch_upstream_icon = true;
                            }; 
                        }
                        {
                            type = "status";
                            style = "diamond";
                            leading_diamond = "";
                            trailing_diamond = "";
                            foreground = "p:white";
                            background = "p:blue";
                            background_templates = [
                                "{{ if gt .Code 0 }}p:red{{ end }}"
                            ];
                            template = " {{ if gt .Code 0 }}{{ else }}{{ end }} ";
                            properties.always_enabled = true;
                        }
                    ];
                }
                {
                    type = "prompt";
                    alignment = "left";
                    newline = true;
                    segments = [
                        {
                            type = "text";
                            foreground = "p:white";
                            template = "❯";
                        }
                    ];
                }
            ];
            tooltips = null;
            transient_prompt = {
                foreground = "p:white";
                background = "transparent";
                template = "❯ ";
            };
            secondary_prompt = {
                foreground = "p:white";
                background = "transparent";
                template = "";
            };
            palette = {
                black = "#1D202F";
                grey = "#414868";
                dark_blue = "#4B6495";
                blue = "#7AA2F7";
                green = "#91C856";
                orange = "#FF8B47";
                red = "#db4b4b";
                white = "#E0DEF4";
                yellow = "#F3AE35";
            };
        };
    };
}
