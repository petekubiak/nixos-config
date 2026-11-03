{ ... }: {
  programs.firefox = {
    enable = true;

    profiles.default = {
      id = 0;
      isDefault = true;

      settings = {
        # Restore previous session
        "browser.startup.page" = 3;
        "signon.rememberSignons" = false;
      };
    };

    policies = {
      ExtensionSettings = {
        # 1 Password
        "{d634138d-c276-4fc8-924b-40a0ea21d284}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/5097307/1password_x_password_manager-8.12.41.1.xpi";
          installation_mode = "force_installed";
        };
      };
    };
  };
}
