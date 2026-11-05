{ pkgs, ... }: {
  home-manager.users.pete.home.packages = [

    # Gaming
    pkgs.mangohud
    pkgs.discord
  ];

  programs.steam = {
    enable = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
  };

  programs.gamemode.enable = true;

}
