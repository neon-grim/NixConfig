{pkgs, ...}:
{
  programs.system-config-printer.enable = true;
  services =
  {
    system-config-printer.enable = true;
    printing =
    {
      enable = true;
      drivers = with pkgs; [ hplip ];
    };
    avahi = 
    {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
}
