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
  ];

  xdg.configFile."hypr/hyprland.lua".source = ./hyprland.lua;

  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };

  home.packages = [
    pkgs.kitty
    pkgs.hyprlauncher
  ];

  dconf.settings."org/gnome/desktop/interface" = {
    color-scheme = "prefer-dark";
  };

  gtk = {
    enable = true;
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
  };
}
