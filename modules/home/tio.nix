{ pkgs, ... }:
{
  home.packages = [ pkgs.tio ];

  xdg.configFile."tio/config".text = /* ini */ ''
    [default]
    map = INLCRNL
  '';
}
