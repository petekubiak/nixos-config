{ pkgs-unstable, ... }:
{
  programs.claude-code = {
    enable = true;
    package = pkgs-unstable.claude-code;

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
