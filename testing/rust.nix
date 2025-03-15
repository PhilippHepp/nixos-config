{pkgs}:

pkgs.mkShell rec {
    buildInputs = with pkgs;[
        rustc
        cargo
        pkg-config
        wayland
        libxkbcommon
        vulkan-headers
        vulkan-loader
        mesa
        libdrm
    ];

    # Winit needs to know where the wayland backend config is located 
    LD_LIBRARY_PATH = "$LD_LIBRARY_PATH:${pkgs.lib.makeLibraryPath buildInputs}";

    WGPU_BACKEND = "Vulkan";
}
