{ inputs }: {
  nixpkgs.config.allowUnfree = true;
  nix = {
    channel.enable = false;
    registry."n".flake = inputs.nixpkgs;

    settings = {
      experimental-features = [ "flakes" "nix-command" ];

      # Remove default bloat
      flake-registry = "";
    };

    gc = {
      automatic = true;
      dates = "Mon *-*-* 00:00:00";
      options = "--delete-older-than 7d";
    };

    optimise = {
      automatic = true;
      dates = "Mon *-*-* 01:00:00";
    };

    systemd.services.nix-optimise.after = [ "nix-gc.service" ];
  };
}
