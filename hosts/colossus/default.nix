{
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/gaming.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    open = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Enable nVidia video drivers
  services.xserver.videoDrivers = [ "nvidia" ];

  # Enable CUPS to print documents.
  services.printing = {
    enable = true;

    drivers = with pkgs; [
      gutenprint
    ];
  };

  system.stateVersion = "25.05";
}
