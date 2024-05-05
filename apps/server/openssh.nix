{ config, ... }: {
  services.openssh.enable = builtins.elem "openssh" config.lsuite.apps.list;
}