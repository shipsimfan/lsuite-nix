{ config, lib, pkgs, ... }: {  
  environment.systemPackages = lib.mkIf (builtins.elem "ovmf" config.lsuite.apps.list) [ pkgs.OVMF ];
}