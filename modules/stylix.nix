{ pkgs, lib, ...}:
let
  theme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-hard.yaml";
  wallpaper = pkgs.runCommand "image.png" { } ''
    COLOR=$(${lib.getExe pkgs.yq} -r .palette.base00 ${theme})
    ${lib.getExe pkgs.imagemagick} -size 2560x1440 xc:$COLOR $out
  '';
in
{
  stylix = {
    image = wallpaper;
    base16Scheme = theme;
  };
}

    # Sombrero
    # image = pkgs.fetchurl {
    #   url = "https://cdn.esahubble.org/archives/images/wallpaper5/opo0328a.jpg";
    #   sha256 = "17n21cifyhmqr0jn25f7m5g69dhna419nbdh76d1bg83jymvjm1x";
    # };
    # polarity = "dark";
