{ pkgs, ... }:
{
  home.username = "pete";
  home.homeDirectory = "/home/pete";
  home.stateVersion = "26.05";

  imports = [
    ./modules/home/git.nix
    ./modules/home/helix.nix
    ./modules/home/jj.nix
    ./modules/home/firefox.nix
    ./modules/home/alacritty.nix
    ./modules/home/starship.nix
    ./modules/home/zsh.nix
    ./modules/home/hyprland.nix
    ./modules/home/waybar.nix
    ./modules/home/hyprlock.nix
    ./modules/home/yazi.nix
  ];

  home.packages = [
    pkgs.hyprlauncher
    pkgs.brightnessctl
    pkgs.playerctl
  ];

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
