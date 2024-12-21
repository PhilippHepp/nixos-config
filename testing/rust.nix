{pkgs}:

pkgs.mkShell {
    nativeBuildInputs = with pkgs; [
        pkg-config
        gobject-introspection
        cargo
        cargo-tauri
        nodejs
    ];

    buildInputs = with pkgs;[
        at-spi2-atk
        atkmm
        cairo
        trunk
        lld
        gdk-pixbuf
        glib
        gtk3
        harfbuzz
        librsvg
        libsoup_3
        pango
        webkitgtk_4_1
        openssl
    ];
}
