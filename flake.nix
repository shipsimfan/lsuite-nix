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

    templates = {
      default = self.templates.system;

      system = {
        path = ./templates/system;
        description = "A minimal system configuration";
        welcomeText = ''
          # Minimal lsuite system configuration
          ## To do before running
          1. Set the `hostname` in "flake.nix"
          2. Set the `description` in "flake.nix"
          3. Set the `user.password` in "configuration.nix" to the hashed password
          4. Add apps to `apps.list` in "configuration.nix"
          
          ## Usage
          Once the configuration is setup, the state can be set with:
          ```sh
          sudo nixos-rebuild switch --flake .
          ```
        '';
      };
    };
  };
}
