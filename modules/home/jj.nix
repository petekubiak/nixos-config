{ config, ... }: {
  programs.jujutsu = {
    enable = true;

    settings = {
      user = config.programs.git.settings.user;
    };
  };
}
