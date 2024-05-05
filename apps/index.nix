{ lib, ... }: {
  imports = [
    ./default/index.nix
    ./dev/index.nix
    ./server/index.nix
  ];

  options.lsuite.apps.list = lib.mkOption {
    type = lib.types.listOf (lib.types.enum [
      "nil"
      "nixpkgs-fmt"
      "openssh"
      "vscode-server"
    ]);
    default = [ ];
    description = "The list of apps to install";
  };
}