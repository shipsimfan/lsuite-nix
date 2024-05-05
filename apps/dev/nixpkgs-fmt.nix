{ config, lib, pkgs, ... }: {
  environment.systemPackages = lib.mkIf (builtins.elem "nixpkgs-fmt" config.lsuite.apps.list) [ pkgs.nixpkgs-fmt ];
}