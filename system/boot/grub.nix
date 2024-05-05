{ config, lib, ... }: {
  options.lsuite.system.bootloader.grub = {
    scan = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Should GRUB scan for other operating systems?";
    };
  };

  config.boot.loader = lib.mkIf (config.lsuite.system.bootloader.type == "grub") {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = config.lsuite.system.bootloader.grub.scan == true;
      default = "saved";
    };
  };
}