{ pkgs, ... }: {
  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
    };

    dconf.enable = true;
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  security.rtkit.enable = true;
  hardware.bluetooth.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services = {
    # Login service provided by tuigreet
    greetd = {
      enable = true;
      settings.default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --background matrix --cmd 'uwsm start hyprland-uwsm.desktop'";
      };
    };

    udisks2.enable = true;
  };

  security.pam.services.hyprlock = { };

}
