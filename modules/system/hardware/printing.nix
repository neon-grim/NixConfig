{...}:
{
  programs.system-config-printer.enable = true;
  services =
  {
    system-config-printer.enable = true;
    printing.enable = true;
    avahi = 
    {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
}