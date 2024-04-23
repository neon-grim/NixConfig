{config, pkgs, ... }: 
{
  #Enable Polkit
  security.polkit.enable = true;
  
  environment.systemPackages = with pkgs;
  [
    polkit_gnome
  ];
  
  # Start gnome_polkit
  systemd = 
  {
    user.services.polkit-gnome-authentication-agent-1 =
    {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = 
      {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  # Allow user to shutdown
  security.polkit.extraConfig = ''
    polkit.addRule
    (
      function(action, subject) 
      {
        if
        (
          subject.isInGroup("users") && 
          (
            action.id == "org.freedesktop.login1.reboot" ||
            action.id == "org.freedesktop.login1.reboot-multiple-sessions" ||
            action.id == "org.freedesktop.login1.power-off" ||
            action.id == "org.freedesktop.login1.power-off-multiple-sessions"
          )
        )
        {
          return polkit.Result.YES;
        }
      }
    )
  '';
}
