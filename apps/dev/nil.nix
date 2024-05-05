{ config, lib, pkgs, ... }: {
  environment.systemPackages = lib.mkIf (builtins.elem "nil" config.lsuite.apps.list) [ pkgs.nil ];
}