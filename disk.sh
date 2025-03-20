echo "Make sure you have the right disk selected!"

$ sudo nix run 'github:nix-community/disko/latest#disko-install' -- --flake '.#${$2}' --disk main $1
