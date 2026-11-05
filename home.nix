{ pkgs, lib, ... }:
{
  home.username = "pete";
  home.homeDirectory = "/home/pete";
  home.stateVersion = "26.05";

  imports = [ ./modules/home ];

  home.packages = [
    pkgs.hyprlauncher
    pkgs.brightnessctl
    pkgs.playerctl

    pkgs.ghidra
  ];

  # Reactivation of hyprlauncher on rebuild
  home.activation.restartHyprlauncher = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    run ${pkgs.procps}/bin/pkill -x hyprlauncher || true
  '';

  dconf.settings."org/gnome/desktop/interface" = {
    color-scheme = "prefer-dark";
  };

  gtk = {
    enable = true;
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
  };

  services.hyprpolkitagent.enable = true;

  services.hyprpaper.enable = true;

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        {
          timeout = 300;
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 330;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          timeout = 1800;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };

  services.playerctld.enable = true;

  stylix.targets.firefox.profileNames = [ "default" ];
}
