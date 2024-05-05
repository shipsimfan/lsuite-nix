{ lib, ... }: {
  imports = [
    ./grub.nix
  ];

  options.lsuite.system.bootloader.type = lib.mkOption {
    type = lib.types.enum [ "grub" ];
    default = "grub";
    description = "The type of bootloader to use";
  };
}