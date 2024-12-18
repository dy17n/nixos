{
  inputs = {
    nixpkgs.url = github:nixos/nixpkgs/nixos-unstable;
    impermanence.url = github:nix-community/impermanence;
    home-manager.url = github:nix-community/home-manager;
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, impermanence, home-manager, ... }:
    {
      nixosConfigurations.dylan-pc = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          impermanence.nixosModules.impermanence
          home-manager.nixosModules.home-manager
          ./configuration.nix
	  ./hardware-configuration.nix
	  ./desktop.nix
        ];
      };
    };
}
