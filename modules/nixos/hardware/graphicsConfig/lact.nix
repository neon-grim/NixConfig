{pkgs, ...}:
{
  environment.systemPackages = with pkgs;
  [
    lact
  ];
  systemd.services.lactd =
  {
    enable = true;
    after = [ "multi-user.target" ];
    description = "AMDGPU Control Daemon";
    serviceConfig =
    {
      ExecStart = "${pkgs.lact}/bin/lact daemon";
    };
    wantedBy = [ "multi-user.target" ];
  };
}