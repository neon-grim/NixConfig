{pkgs, config, ...}:
let
  cursorSize = config.desktop.style.cursorSize;
in
{
  home =
  {
    pointerCursor =
    {
      gtk.enable = true;
      x11.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Original-Classic";
      size = cursorSize;
    };
  };
}