{
  inputs = {
    impermanence.url = "github:nix-community/impermanence";
  };

  outputs = { self, nixpkgs, impermanence, ... }:
    {
      nixosConfigurations.dylan-pc = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          impermanence.nixosModules.impermanence
          ./configuration.nix
        ];
      };
    };
}
