{ inputs, hostname, ... }: {
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.mgrac = ../../../homes/${hostname}.nix;

    sharedModules = [ ../../home-manager ];

    extraSpecialArgs = { inherit inputs hostname; };
  };
}
