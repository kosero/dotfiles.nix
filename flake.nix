{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.6.0";
    nixvim.url = "github:nix-community/nixvim/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, nix-flatpak, nixvim, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };

      extraSpecialArgs = { inherit system inputs; };
    in {
      homeConfigurations = {
        kosero = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          extraSpecialArgs = extraSpecialArgs;

          modules = [
            nix-flatpak.homeManagerModules.nix-flatpak
            nixvim.homeManagerModules.nixvim
            ./home
          ];
        };
      };

      nixosConfigurations = {
        kosero = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            ./nixos/configuration.nix
            ./nixos/hardware-configuration.nix
          ];
        };
      };
    };
}

