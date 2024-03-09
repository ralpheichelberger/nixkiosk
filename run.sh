nix run github:nix-community/nixos-anywhere -- --debug --flake '.#infoboard' root@192.168.30.113

?? nixos-rebuild switch --flake <URL to your flake> --target-host "root@<ip address>"


nixos-rebuild switch --flake .# --target-host root@192.168.30.113