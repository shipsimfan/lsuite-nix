{ config, ... }: {
  services.vscode-server.enable = builtins.elem "vscode-server" config.lsuite.apps.list;
}