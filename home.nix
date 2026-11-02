{ ... }:
{
  home.username = "pete";
  home.homeDirectory = "/home/pete";
  home.stateVersion = "26.05";

  imports = [
    ./modules/home/git.nix
    ./modules/home/helix.nix
    ./modules/home/jj.nix
  ];
}
