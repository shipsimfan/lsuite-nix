{ ... }: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    # Base include
    ../../index.nix
  ];

  lsuite = {
    system = {
      hostname = "home-nixdev1";
      auto-upgrade = true;
    };

    apps.list = [
      "nil"
      "nixpkgs-fmt"
      "openssh"
      "vscode-server" 
    ];
  };
  
  # DO NOT CHANGE
  system.stateVersion = "23.11";
}
