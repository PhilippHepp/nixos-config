{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    (blender.override {cudaSupport = true;})
  ];

  # look into termgl for light in-terminal-rendering
}
