{pkgs, user, config, lib, ...}:
let
  compositor = config.home-manager.users.${user}.desktop.system.compositors.defaultSession;
  kbLayout = config.home-manager.users.${user}.desktop.system.kb.layout;
  kbVariant = config.home-manager.users.${user}.desktop.system.kb.variant;
in
{
  programs.regreet =
  {
    enable = true;
    cursorTheme.name = "Bibata-Original-Classic";
    iconTheme.name = "Dracula";
    settings =
    {
      keyboard =
      {
        layout = kbLayout;
        variant = kbVariant;
      };
      default_session = compositor;
    };
  };
  services.cage = 
  {
    enable = true;
  };
  services.greetd =
  {
    enable = true;
    settings =
    {
      default_session =
      {
        command = "${lib.getExe pkgs.cage} -s -- ${lib.getExe pkgs.regreet}";
        user = "${user}";
      };
    };
  };
}