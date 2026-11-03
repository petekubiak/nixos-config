{ ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      keyboard.bindings = [
        {
          key = "n";
          mods = "Control | Shift";
          action = "CreateNewWindow";
        }
      ];
    };
  };
}
