{ lib }: {
  zramSwap.enable = true;
  swapDevices = lib.singleton {
    device =
      "${optionalString impermenance.enable "/persist"}/var/lib/swapfile";
    size = 20480; # Size to allocate in MB (20GB)
  };

  boot = {
    initrd.systemd.enable = true;
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        consoleMode = "auto";
        configurationLimit = 10;
      };
    };

    services.fstrim.enable = true;
  };
}
