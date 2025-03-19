{pkgs, ...}:

{
    services.flameshot.enable = true;
    services.flameshot.package = (pkgs.flameshot.override {enableWlrSupport = true;});
    services.flameshot.settings = {
      General = {
        savePath = "/home/donielmaker/screenshots/";
        # savePathFixed = false;
        # saveAsFileExtension = ".png";
        # showHelp = true;
        # showSidePanelButton = false;
        # ignoreUpdateToVersion = "";
        # showDesktopNotification = false;
        # filenamePattern = "%F_%H-%M";
        # disabledTrayIcon = true;
        # disabledGrimWarning = true;
        # autoCloseIdleDaemon = false;
        # allowMultipleGuiInstances = false;
        # drawThickness = 1;
        # keepOpenAppLauncher = true;
        # startupLaunch = false;
        # contrastOpacity = 190;
        # saveAfterCopy = false;
        # copyPathAfterSave = true;
        # copyAndCloseAfterUpload = false;
        # antialiasingPinZoom = true;
        # useJpgForClipboard = false;
        # uploadWithoutConfirmation = false;
        # predefinedColorPaletteLarge = false;
        # jpegQuality = 75;
      };
      Shortcuts = {
        TYPE_ARROW = "A";
        TYPE_CIRCLE = "C";
        TYPE_CIRCLECOUNT = "";
        TYPE_COMMIT_CURRENT_TOOL = "Ctrl+Return";
        TYPE_COPY = "Ctrl+C";
        TYPE_DRAWER = "D";
        TYPE_EXIT = "Ctrl+Q";
        TYPE_IMAGEUPLOADER = "Return";
        TYPE_MARKER = "M";
        TYPE_MOVESELECTION = "Ctrl+M";
        TYPE_MOVE_DOWN = "Down";
        TYPE_MOVE_LEFT = "Left";
        TYPE_MOVE_RIGHT = "Right";
        TYPE_MOVE_UP = "Up";
        TYPE_OPEN_APP = "Ctrl+O";
        TYPE_PENCIL = "P";
        TYPE_PIN = "";
        TYPE_PIXELATE = "B";
        TYPE_RECTANGLE = "R";
        TYPE_REDO = "Ctrl+Shift+Z";
        TYPE_RESIZE_DOWN = "Shift+Down";
        TYPE_RESIZE_LEFT = "Shift+Left";
        TYPE_RESIZE_RIGHT = "Shift+Right";
        TYPE_RESIZE_UP = "Shift+Up";
        TYPE_SYM_RESIZE_DOWN = "Ctrl+Shift+Down";
        TYPE_SYM_RESIZE_LEFT = "Ctrl+Shift+Left";
        TYPE_SYM_RESIZE_RIGHT = "Ctrl+Shift+Right";
        TYPE_SYM_RESIZE_UP = "Ctrl+Shift+Up";
        TYPE_SAVE = "Ctrl+S";
        TYPE_SELECTION = "S";
        TYPE_SELECTIONINDICATOR = "";
        TYPE_SELECT_ALL = "Ctrl+A";
        TYPE_TEXT = "T";
        TYPE_TOGGLE_PANEL = "Space";
        TYPE_UNDO = "Ctrl+Z";
      };
    };
}
