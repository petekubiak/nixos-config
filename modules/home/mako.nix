{ pkgs, ... }: {
  services.mako = {
    enable = true;
    settings = {
      anchor = "top-right";
      margin = "10";
      border-size = 2;
      border-radius = 10;
      default-timeout = 5000;
      "mode=do-not-disturb" = {
        invisible = 1;
      };
    };
  };

  home.packages = [ pkgs.libnotify ];
}
