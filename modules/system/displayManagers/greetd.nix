{pkgs, username, ...}:
{
  services.greetd =
  {
    enable = true;
    settings =
    {
      default_session = 
      {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd 'sway -Dnoscanout'";
        user = "${username}";
      };
    };
  };
  environment.systemPackages = with pkgs;
  [
    greetd.tuigreet
  ];
}