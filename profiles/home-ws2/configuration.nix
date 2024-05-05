{ config, lib, pkgs, ... }: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Use the GRUB EFI boot loader.
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    useOSProber = true;
    default = "saved";
  };

  # Set basic networking information
  networking.hostName = "lance-desktop-nixos";

  # Set the timezone and locale
  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.UTF-8";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  security.rtkit.enable = true;

  # Define a user account
  users.users.lhart = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable "sudo"
  };

  # Enable desktop environment
  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
    desktopManager = { cinnamon.enable = true; };
  };
  services.displayManager.defaultSession = "cinnamon";
  services.libinput.enable = true;

  # Enable NVidia drivers
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  services.xserver.videoDrivers = [ "nvidia" ];

  # Enable Auto Updates
  system.autoUpgrade = {
    enable = true;
    allowReboot = true;
    channel = "https://channels.nixos.org/nixos-unstable";
  };

  # Packages installed system wide
  environment.systemPackages = with pkgs; [
    # Web
    google-chrome
    curl
    wget

    # Development
    vscode
    vim
    git
    nixpkgs-fmt
  ];
  programs.direnv.enable = true;

  # Allow specific non-free packages
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "google-chrome"
    "vscode"
    "nvidia-x11"
    "nvidia-settings"
  ];

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system.copySystemConfiguration = true;

  # DO NOT CHANGE
  system.stateVersion = "23.11";
}

