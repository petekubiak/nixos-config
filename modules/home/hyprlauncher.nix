{
  config,
  ...
}:
let
  theme = config.lib.stylix.colors;
  fonts = config.stylix.fonts;
  colour = name: "0xFF${theme.${name}}";
in
{
  xdg.configFile."hypr/hyprtoolkit.conf".text = ''
    background = ${colour "base00"}
    base = ${colour "base01"}
    alternate_base = ${colour "base02"}
    text = ${colour "base05"}
    bright_text = ${colour "base06"}
    link_text = ${colour "base0C"}
    accent = ${colour "base0D"}
    accent_secondary = ${colour "base0E"}

    font_family = ${fonts.sansSerif.name}
    font_family_monospace = ${fonts.monospace.name}
  '';
}
