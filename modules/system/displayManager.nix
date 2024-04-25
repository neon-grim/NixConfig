{
  # Enable and configure sddm
  services.xserver.displayManager.sddm = 
  {
    enable = true;
    autoNumlock = true;
    wayland.enable = true;
  };
}
