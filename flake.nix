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
    nixosConfigurations = {
      # nix-ws1 Hyper-V virtual machines
      home-nixdev1 = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ 
          # Dependencies
          inputs.vscode-server.nixosModules.default

          # Profile
          ./profiles/home-nixdev1/configuration.nix
        ];
      };

    };
  };
  
}
