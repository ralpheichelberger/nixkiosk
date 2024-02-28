{ modulesPath, config, lib, pkgs, ... }: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
    ./disk-config.nix
  ];
  boot.loader.grub = {
    # no need to set devices, disko will add all devices that have a EF02 partition to the list already
    # devices = [ ];
    efiSupport = true;
    efiInstallAsRemovable = true;
  };
  services.openssh.enable = true;

  # networking = {
  #   useDHCP = false; # Disable DHCP
  #   interfaces.enp2s0 = {
  #     ipv4.addresses = [{
  #       address = "10.0.0.2";
  #       prefixLength = 24; # Equivalent to netmask 255.255.255.0
  #     }];
  #   };
  # };

  environment.systemPackages = map lib.lowPrio [
    pkgs.curl
    pkgs.gitMinimal
  ];

  users.users.root.openssh.authorizedKeys.keys = [
    (builtins.readFile ./id_rsa.pub)
  ];

  system.stateVersion = "23.11";
}