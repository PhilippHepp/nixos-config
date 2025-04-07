{pkgs, ...}:

{
    services.flameshot.enable = true;
    services.flameshot.package = (pkgs.flameshot.override {enableWlrSupport = true;});
    services.flameshot.settings = {
      General = {
        savePath = "/home/philipp/Images/Screenshots/";
        # savePathFixed = false;
        saveAsFileExtension = ".png";
        # showSidePanelButton = false;
        # ignoreUpdateToVersion = "";
        # showDesktopNotification = false;
        # filenamePattern = "%F_%H-%M";
        disabledTrayIcon = true;
        disabledGrimWarning = true;
        # autoCloseIdleDaemon = false;
        # allowMultipleGuiInstances = false;
        # drawThickness = 1;
        # keepOpenAppLauncher = true;
        # startupLaunch = false;
        # contrastOpacity = 190;
        # saveAfterCopy = false;
        # copyPathAfterSave = true;
        # antialiasingPinZoom = true;
        # useJpgForClipboard = false;
        # uploadWithoutConfirmation = false;
        # predefinedColorPaletteLarge = false;
        # jpegQuality = 75;
      };
      Shortcuts = {
        TYPE_COPY = "Shift+Enter";
        TYPE_EXIT = "Esc";
        TYPE_SAVE = "Enter";
        TYPE_UNDO = "Ctrl+Z";
      };
    };
}
