{ ... }: {
  programs.firefox = {
    enable = true;

    profiles.default = {
      id = 0;
      isDefault = true;

      settings = {
        # Restore previous session
        "browser.startup.page" = 3;
      };
    };
  };
}
