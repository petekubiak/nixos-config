{ pkgs, ... }:
let
  qmk = pkgs.fetchFromGitHub {
    owner = "qmk";
    repo = "qmk_firmware";
    rev = "18ed7c6cafec5a14751500ebfbb75d1262cfefbe";
    sha256 = "sha256-WATnQmELOq6/4EaxdZvjLIPSypF73TQlgAwdbTlpcBE=";
  };
in
{
  services.udev.extraRules = builtins.readFile "${qmk}/util/udev/50-qmk.rules";
}
