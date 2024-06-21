{ config, lib, pkgs, ... }: {
  environment.systemPackages = lib.mkIf (builtins.elem "rust" config.lsuite.apps.list) [ pkgs.rustup ];
}