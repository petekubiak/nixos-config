{ pkgs, inputs, ... }: {
  stylix = {
    enable = true;
    image = inputs.wallpaper;
    polarity = "dark";
    fonts.monospace = {
      package = pkgs.nerd-fonts.sauce-code-pro;
      name = "SauceCodePro Nerd Font Mono";
    };
  };

}
