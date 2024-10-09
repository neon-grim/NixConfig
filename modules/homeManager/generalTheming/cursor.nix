{pkgs, config, ...}:
{
  home =
  {
    pointerCursor =
    {
      gtk.enable = true;
      x11.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Original-Classic";
      size = config.desktop.style.cursorSize;
    };
  };
}