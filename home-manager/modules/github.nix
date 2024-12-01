{
    programs.gh = {
        enable = true;
        gitCredentialHelper.enable = true;
        gitCredentialHelper.hosts = [
            "https://github.com"
        ];
        settings.editor = "nvim";
    };
}
