{ config, lib, pkgs, ... }: {
  environment.systemPackages = lib.mkIf (builtins.elem "clang" config.lsuite.apps.list) [ pkgs.clang ];
}