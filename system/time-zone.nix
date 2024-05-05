{ config, lib, ... }: {
  options.lsuite.system.timeZone = lib.mkOption {
    type = lib.types.nonEmptyStr;
    description = "The time-zone for the system";
    default = "America/Toronto";
  };

  config.time.timeZone = config.lsuite.system.timeZone;
}