printf "Make sure you have the right disk selected!\nFlake:\t%s\nDisk:\t%s\n\n" "$1" "$2"

# Wait for User to confirm
while true; do
  read -r -p "Press Enter to continue..." key
  if [[ -z "$key" ]]; then
    break
  fi
done

echo "doing evil"

sudo nix run 'github:nix-community/disko/latest#disko-install' -- --flake ".#$1" --disk main "$2"
