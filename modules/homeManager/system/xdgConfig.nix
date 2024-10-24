{...}:
{
  xdg = 
  {
    enable = true;
    configFile."mimeapps.list".force = true;
    mimeApps =
    {
      enable = true;
      defaultApplications =
      {
        "audio/mp3" = ["org.gnome.Lollypop.desktop"];
        "audio/flac" = ["org.gnome.Lollypop.desktop"];
        "video/mp4" = ["io.github.celluloid_player.Celluloid.desktop"];
        "application/pdf" = ["zen.desktop"];
        "image/jpeg" = ["org.libvips.vipsdisp.desktop"];
        "image/png" = ["org.libvips.vipsdisp.desktop"];
        "text/plain" = ["org.xfce.mousepad.desktop"];
        "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = ["onlyoffice-desktopeditors.desktop"];
        "application/vnd.openxmlformats-officedocument.presentationml.presentation" = ["onlyoffice-desktopeditors.desktop"];
        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = ["onlyoffice-desktopeditors.desktop"];
      };
    };
    userDirs = 
    {
      enable = true;
      createDirectories = true;
    };
  };
}