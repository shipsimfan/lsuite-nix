{
  description = "Describe the server";

  inputs = { 
    lsuite.url = "github:shipsimfan/lsuite-nix"; 
    nixpkgs.url = "nixpkgs/nixos-unstable";  
  };

  outputs = 
    let hostname = "hostname here"; in 
    {self, ...}@inputs: {
      nixosConfigurations = {
        ${hostname} = inputs.nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = inputs ++ [ hostname ];
          modules = [ ./configuration.nix ];
        };
      };
  };
}
