{ ... }: {
  programs.hyprlock = {
    enable = true;
    settings = {
      general.hide_cursor = true;
      auth."fingerprint:enabled" = true;
    };
  };
}
