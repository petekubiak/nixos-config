{ config, pkgs-unstable, ... }: {
  programs.jujutsu = {
    enable = true;
    package = pkgs-unstable.jujutsu;

    settings = {
      user = config.programs.git.settings.user;
      ui.editor = "hx";
    };
  };
}
