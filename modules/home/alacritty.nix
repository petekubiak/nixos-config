{ config, ... } : {
  programs.alacritty = {
    enable = true;
    settings = {
      keyboard.bindings = [
        { key = "n"; mods = "Control | Shift"; action = "CreateNewWindow"; }
      ];
      # font = {
      #   normal = {
      #     family = "Sauce Code Pro Nerd Font";
      #     style = "Regular";
      #   };
      #   bold = {
      #     family = "Sauce Code Pro Nerd Font";
      #     style = "Bold";
      #   };
      #   italic = {
      #     family = "Sauce Code Pro Nerd Font";
      #     style = "Italic";
      #   };
      #   bold_italic = {
      #     family = "Sauce Code Pro Nerd Font";
      #     style = "Bold Italic";
      #   };
      # };
    };
    theme = "autumn";
  };
}
