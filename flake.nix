{
  description = "System configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Ghidra 12.2 shows a grey, unresponsive window under Hyprland; pin to
    # the unstable revision that shipped 12.1.4 until that's fixed.
    nixpkgs-ghidra.url = "github:NixOS/nixpkgs/0bb2eedc20e4739f29e8045034f2828ad7054f8f";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    wallpaper = {
      url = "file+https://unsplash.com/photos/acGzfQW2e7Q/download";
      flake = false;
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      stylix,
      ...
    }@inputs:
    let
      pkgs-unstable = import inputs.nixpkgs-unstable {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };

      pkgs-ghidra = import inputs.nixpkgs-ghidra {
        system = "x86_64-linux";
      };

      mkHost =
        hostname:
        nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/${hostname}
            ./modules/nixos
            stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager
            {
              networking.hostName = hostname;
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit pkgs-unstable pkgs-ghidra; };
                users.pete = ./home.nix;
              };
            }
          ];
        };
    in
    {
      nixosConfigurations = {
        framework = mkHost "framework";
        colossus = mkHost "colossus";
      };
    };
}
