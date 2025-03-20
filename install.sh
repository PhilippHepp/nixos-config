echo "Make sure you have the right disk selected!"
echo "Selected Config: $1"
echo "Selected Disk: $2"
echo ""

sudo nix run 'github:nix-community/disko/latest#disko-install' -- --flake '.#$1' --disk main '$2'
