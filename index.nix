{ ... }: {
  imports = [
    ./apps/index.nix
    ./system/index.nix
    ./user/index.nix
  ];

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}