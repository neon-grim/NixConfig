{pkgs, ...}:
{
  hardware.xone.enable = true;
  programs =
  {
    gamemode.enable = true;
    steam = 
    {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };
  environment.systemPackages = with pkgs;
  [
    goverlay
    heroic
    jstest-gtk
    lact
    libstrangle
    mangohud
    protonplus
    protontricks
    scanmem
    vkbasalt
  ];
  systemd.services.lactd = 
  {
    description = "AMDGPU Control Daemon";
    enable = true;  
    serviceConfig = 
    {
      ExecStart = "${pkgs.lact}/bin/lact daemon";
    };
    wantedBy = ["multi-user.target"];
  };
}
