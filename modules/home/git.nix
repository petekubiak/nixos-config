{ config, ... }: {
  programs.git = {
    enable = true;
    settings = {
      aliases = {
        graph = "log --oneline --all --graph --decorate";
        wd = "diff --word-diff";
        rl = "reflog --date=iso --pretty";
        history = "blame -C -C -C";
        co = "checkout";
      };
      user.email = "peter.s.kubiak@bath.edu";
      user.name = "Pete Kubiak";
      gpg.format = "ssh";
      commit.gpgSign = true;
      init.defaultBranch = "main";
      merge = {
        tool = "vimdiff";
        conflictStyle = "diff3";
      };
      mergetool.hideResolved = true;
      rerere.enabled = true;
    };
    signing.key = "/home/pete/.ssh/id_ed25519.pub";
  };
  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      side-by-side = true;
      line-numbers = true;
    };
  };
}
