{ config, lib, ... }: {
  options.lsuite.system.auto-upgrade = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Should the system automatically upgrade?";
  };
  
  config.system.autoUpgrade = lib.mkIf config.lsuite.system.auto-upgrade {
    enable = true;
    allowReboot = true;
    channel = "https://channels.nixos.org/nixos-unstable";
  };
}