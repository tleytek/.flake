{
  description = "Mateus' first flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

    ghostty.url = "github:ghostty-org/ghostty";

    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ghostty, ... }: 
    let
    system = "x86_64-linux";
  lib = nixpkgs.lib;

  pkgs = nixpkgs.legacyPackages.${system};
  pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};

  ghostty-pkg = ghostty.packages.${system}.default;
  in
  {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
        modules = [ ./configuration.nix ];
        specialArgs = {
          inherit ghostty-pkg;
          inherit pkgs-unstable;
        };
      };
    };
    homeConfigurations = {
      mateus = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home.nix ];
        extraSpecialArgs = {
          inherit pkgs-unstable;
        };
      };
    };
  };
}
