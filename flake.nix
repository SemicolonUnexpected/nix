{
  description = "";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    let
      system = "x86_64-linux";
      specialArgs = {

      };
    in
    { self, nixpkgs, ... }:
    {
      nixosConfigurations."laptop" = nixpkgs.lib.nixosSystem {
        inherit system specialArgs;
        modules = [ ./hosts/laptop.nix ];
      };
    };
}
