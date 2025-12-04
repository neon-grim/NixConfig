{pkgs, user, lib, ...}:
{
  environment.systemPackages = with pkgs;
  [
    tuigreet
  ];
  services.greetd =
  {
    enable = true;
    settings =
    {
      default_session =
      {
        command = 
        (
          "${pkgs.tuigreet}/bin/tuigreet --time --remember --remember-session --user-menu --asterisks " +
          "--theme border=magenta;text=cyan;prompt=green;time=red;action=blue;button=yellow;container=black;input=red"
        );
        user = "${user}";
      };
    };
  };
}