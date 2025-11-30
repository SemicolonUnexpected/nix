{
  description = "Matthew's flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    impermanence.url = "github:nix-community/impermanence";
  };

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      specialArgs = {
        inherit (self) inputs;
        hostname = "laptop";
      };
    in {
      nixosConfigurations."laptop" = nixpkgs.lib.nixosSystem {
        inherit system specialArgs;
        modules = [ ./hosts/laptop.nix ];
      };
    };
}
