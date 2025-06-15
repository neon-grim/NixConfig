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
    scanmem
    vkbasalt
  ];
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
    capSysAdmin = true;
    openFirewall = true;
  };
}
