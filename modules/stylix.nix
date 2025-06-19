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
    stylixOptions.generateTheme = lib.mkEnableOption "";
  };
  config =
  let
    theme = "${pkgs.base16-schemes}/share/themes/${config.stylixOptions.scheme}.yaml";
    wallpaper = config.lib.stylix.pixel "base00";
  in
  {
    stylix = {
      image = if (config.stylixOptions.image != null) then config.stylixOptions.image else wallpaper;
      polarity = lib.mkIf(config.stylixOptions.image != null) "dark";
      base16Scheme = lib.mkIf(!config.stylixOptions.generateTheme || config.stylixOptions.image == null) theme;
    };
  };
}
