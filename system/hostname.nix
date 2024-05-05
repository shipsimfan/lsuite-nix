{ config, lib, ... }: {
  options.lsuite.system.hostname = lib.mkOption {
    type = lib.types.nonEmptyStr;
    description = "The hostname of the system";
  };

  config.networking.hostName = config.lsuite.system.hostname;
}