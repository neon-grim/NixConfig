{pkgs, config, lib, ...}:
let
  printingEnabled = config.desktop.drivers.printing;
in
{
  programs.system-config-printer.enable = printingEnabled;
  services = lib.mkIf (printingEnabled)
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
