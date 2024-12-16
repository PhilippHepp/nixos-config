{pkgs ? import <nixpkgs>{}}: 

pkgs.writeShellApplication {
    name = "eww-bluetooth";

    runtimeInputs = [pkgs.bluez];

    text = ''
        bluetoothctl -t "$1" scan on > /dev/null
        bluetoothctl devices | awk '{for(i=3;i<=NF;i++) printf "%s ", $i; print ""}'
    '';
}

