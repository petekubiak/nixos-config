{ config, pkgs-unstable, ... }: {
  programs.jujutsu = {
    enable = true;
    package = pkgs-unstable.jujutsu;

    settings = {
      user = config.programs.git.settings.user;
      ui.editor = "hx";

      fix.tools.clang-format = {
        command = [
          "clang-format"
          "--assume-filename=$path"
        ];
        patterns = [ "glob:'**/*.{c,cpp,h}'" ];
      };
    };
  };
}
