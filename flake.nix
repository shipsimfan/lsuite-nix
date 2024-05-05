{
  description = "LSuite NixOS configurations";

  # Input repositories
  inputs = {
    # Unstable NixPkgs repository
    nixpkgs.url = "nixpkgs/nixos-unstable";

    # Commercial GitHub repository
    vscode-server.url = "github:nix-community/nixos-vscode-server";
  };

  outputs = {self, ...}@inputs: {
    modules = [
      # Dependencies
      inputs.vscode-server.nixosModules.default

      # Profile
      ./apps/index.nix
      ./system/index.nix
      ./user/index.nix
    ];
  };
}
