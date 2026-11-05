{ pkgs, inputs, ... }: {
  stylix = {
    enable = true;
    image = inputs.wallpaper;
    polarity = "dark";
    fonts.monospace = {
      package = pkgs.nerd-fonts.hack;
      name = "Hack Nerd Font Mono";
    };
  };

}
