{ ... }:
{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;

  programs.nh = {
    enable = true;
    flake = "/home/pete/nixos-config";
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
  };
}
