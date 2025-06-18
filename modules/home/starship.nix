{ config, lib, ... }:
let
  palette = config.lib.stylix.colors;
in
{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
  };
}
