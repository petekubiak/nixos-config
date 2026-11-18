{ ... }:
{
  programs.gh = {
    enable = true;

    gitCredentialHelper.enable = false;

    settings = {
      git_protocol = "ssh";
    };
  };
}
