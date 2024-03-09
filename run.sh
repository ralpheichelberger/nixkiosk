#install
nix run github:nix-community/nixos-anywhere -- --debug --flake '.#infoboard' root@192.168.30.133

#update after configuration changed
nixos-rebuild switch --flake .#infoboard --target-host root@192.168.30.133