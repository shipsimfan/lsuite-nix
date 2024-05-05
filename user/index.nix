{ config, lib, ... }: {
  options.lsuite.user = {
    username = lib.mkOption {
      type = lib.types.nonEmptyStr;
      default = "lhart";
      description = "The login username for the user";
    };
    name = lib.mkOption {
      type = lib.types.nonEmptyStr;
      default = "Lance Hart";
      description = "The user's full name";
    };
    password = lib.mkOption {
      type = lib.types.nonEmptyStr;
      default = "$y$j9T$YGUvXrTnk/GU125xVA5yx/$GRqmIwm2bkl.NhHectU335c5S3UXxRNzA0cCLKvzD83";
      description = "The hashed password for the user";
    };
    keys = lib.mkOption {
      type = lib.types.listOf lib.types.nonEmptyStr;
      default = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINHSkeixnPiorAhjMnDmvlhwHgbiDsSdc8tEoNhEdaDr shipsimfan@Lance-Desktop"
      ];
      description = "The list of SSH keys to accept";
    };
  };

  config.users.users.${config.lsuite.user.username} = {
    description = config.lsuite.user.name;
    hashedPassword = config.lsuite.user.password;
    openssh.authorizedKeys.keys = config.lsuite.user.keys;

    isNormalUser = true;
    homeMode = "700";
    extraGroups = [ "wheel" ];
  };
}