{pkgs, ...}: {
  home.packages = with pkgs; [
    (blender.override {cudaSupport = true;})
    krita
    godot
    ascii-image-converter
  ];

  # TODO: look into termgl for light in-terminal-rendering
}
