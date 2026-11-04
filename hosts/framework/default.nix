{ ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  programs = {
    _1password.enable = true;
    _1password-gui = {
      enable = true;
      polkitPolicyOwners = [ "pete" ];
    };

  };

  # Laptop power management and firmware updates
  services = {
    power-profiles-daemon.enable = true;
    fwupd.enable = true;
  };

  # Fingerprint scanner
  services.fprintd.enable = true;
  security.pam.services = {
    greetd.fprintAuth = false;
    hyprlock.fprintAuth = false;
  };

  system.stateVersion = "26.05"; # Did you read the comment?

}
