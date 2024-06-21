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
    templates = {
      system = {
        path = ./templates/system;
        description = "A minimal system configuration";
      };

      dev = {
        path = ./templates/dev;
        description = "A development environment for lsuite";
      };
      
      default = self.templates.system;
    };

    nixosModules.default = {
      imports = [
        # Dependencies
        inputs.vscode-server.nixosModules.default

        # Profile
        ./apps/index.nix
        ./system/index.nix
        ./user/index.nix
      ];
    };
  };
}
