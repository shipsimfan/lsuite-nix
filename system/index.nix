{ ... }: {
  imports = [
    ./auto-upgrade.nix
    ./hostname.nix
    ./locale.nix
    ./time-zone.nix
    ./boot/index.nix
  ];
}