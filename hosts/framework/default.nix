{ pkgs, ... }:
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

  # Monitor positioning
  home-manager.users.pete.wayland.windowManager.hyprland.extraConfig = /* lua */ ''
    -- Home setup
    hl.monitor({ output = "desc:GIGA-BYTE TECHNOLOGY CO. LTD. AORUS AD27QD 19270B000840", mode = "preferred", position = "auto-left", scale = 1})
  '';

  # Applications
  home-manager.users.pete.home.packages = [ pkgs.zoom-us ];

  system.stateVersion = "26.05";
}
