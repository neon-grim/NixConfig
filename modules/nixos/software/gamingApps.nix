{pkgs, ...}:
{
  environment.systemPackages = with pkgs;
  [
    heroic
    jstest-gtk
    libstrangle
    mangohud
    mangojuice
    protonplus
    ryujinx
    shadps4
    scanmem
    vkbasalt
  ];
  hardware =
  {
    steam-hardware.enable = true;
  };
  programs =
  {
    gamescope =
    {
      enable = true;
    };
    gamemode =
    {
      enable = true;
      enableRenice = true;
    };
    steam =
    {
      enable = true;
      protontricks.enable = true;
    };
  };
  services.sunshine =
  {
    enable = true;
    autoStart = false;
    capSysAdmin = true;
    openFirewall = true;
  };
}
