{ lsuite, hostname, ... }: {
  imports = [ 
    lsuite.nixosModules.default
    ./hardware-configuration.nix 
  ];

  config = {
    lsuite = {
      system = {
        hostname = hostname;
        auto-upgrade = true;
      };

      user.password = "insert hashed password here";

      apps.list = [ ];
    };
    
    # DO NOT CHANGE
    system.stateVersion = "23.11";
  };
}
