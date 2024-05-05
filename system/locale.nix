{ config, lib, ... }: {
  options.lsuite.system.locale = lib.mkOption {
    type = lib.types.nonEmptyStr;
    description = "The locale of the system";
    default = "en_CA.UTF-8";
  };

  config.i18n.defaultLocale = config.lsuite.system.locale;
}