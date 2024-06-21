{ lib, ... }: {
  imports = [
    ./default/index.nix
    ./dev/index.nix
    ./server/index.nix
    ./virtualization/index.nix
  ];

  options.lsuite.apps.list = lib.mkOption {
    type = lib.types.listOf (lib.types.enum [
      "clang"
      "nil"
      "nixpkgs-fmt"
      "openssh"
      "ovmf"
      "qemu"
      "rust"
      "vscode-server"
    ]);
    default = [ ];
    description = "The list of apps to install";
  };
}