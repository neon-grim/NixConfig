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
    bottles
    corectrl
    discord
    goverlay
    gamescope
    heroic
    jstest-gtk
    lact
    libstrangle
    mangohud
    prismlauncher
    protonplus
    protontricks
    scanmem
    vesktop
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
