{pkgs, ...}: {
  home.packages = with pkgs; [
    # (blender.override {cudaSupport = true;})
    krita
  ];

  # look into termgl for light in-terminal-rendering
}
