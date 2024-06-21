{ config, lib, pkgs, ... }: {  
  environment.systemPackages = lib.mkIf (builtins.elem "qemu" config.lsuite.apps.list) [ pkgs.qemu ];
}