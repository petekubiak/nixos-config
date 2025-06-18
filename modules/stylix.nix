{ pkgs, lib, config, ...}:
{
  options = {
    stylixOptions.scheme = lib.mkOption {
      type = lib.types.str;
      default = "gruvbox-material-dark-hard";
    };
    stylixOptions.image = lib.mkOption {
      type = lib.types.nullOr lib.types.path;
      default = null;
    };
  };
  config =
  let
    theme = "${pkgs.base16-schemes}/share/themes/${config.stylixOptions.scheme}.yaml";
    wallpaper = pkgs.runCommand "image.png" { } ''
      COLOR=$(${lib.getExe pkgs.yq} -r .palette.base00 ${theme})
      ${lib.getExe pkgs.imagemagick} -size 2560x1440 xc:$COLOR $out
    '';
  in
  {
    stylix = {
      image = if (config.stylixOptions.image != null) then config.stylixOptions.image else wallpaper;
      polarity = lib.mkIf(config.stylixOptions.image != null) "dark";
      base16Scheme = lib.mkIf(config.stylixOptions.image == null) theme;
    };
  };
}
