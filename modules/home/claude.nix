{ pkgs, pkgs-unstable, ... }:
{
  # inotifywait, used by the /pair skill's watcher
  home.packages = [ pkgs.inotify-tools ];

  programs.claude-code = {
    enable = true;
    package = pkgs-unstable.claude-code;

    skills.pair = ./claude/skills/pair;

    settings = {
      env.DISABLE_AUTOUPDATER = "1";
      permissions = {
        deny = [
          "Bash(git push:*)"
          "Bash(jj git push:*)"
          "Read(./.env)"
          "Read(./.env.*)"
          "Read(./secrets/**)"
        ];

      };
    };

    context = ''
      # Environment
      - If you require a tool, please discuss it with me.
      - I use jujutsu (jj) for version control, colocated with git.
      - Please write in UK English.
    '';
  };
}
