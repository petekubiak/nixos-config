{ config, ... }: {
  programs.git = {
    enable = true;
    aliases = {
      graph = "log --oneline --all --graph --decorate";
      wd = "diff --word-diff";
      rl = "reflog --date=iso --pretty";
      history = "blame -C -C -C";
      co = "checkout";  
    };
    delta = {
      enable = true;
      options = {
        side-by-side = true;
        line-numbers = true;
      };
    };
    extraConfig = {
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
    userEmail = "peter.s.kubiak@bath.edu";
    userName = "Pete Kubiak";
  };
}
