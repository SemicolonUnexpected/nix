{
  users = {
    users.mutableUsers = false;
    user."mgrac" = {
      isNormal = true;
      extraGroups = [ "wheel" ];

      # PLS FIX
      password = "test";
    };
  };
}
