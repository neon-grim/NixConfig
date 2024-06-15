{config, pkgs, ...}:
{
  xdg.mimeApps =
  {
    enable = true;
    defaultApplications =
    {
      "audio/mp3" = ["org.gnome.Rhythmbox3.desktop" "vlc.desktop"];
      "audio/flac" = ["org.gnome.Rhythmbox3.desktop" "vlc.desktop"];
      "video/mp4" = ["vlc.desktop"];
      "inode/directory" = ["thunar.desktop"];
      "application/pdf" = ["firefox.desktop"];
      "image/jpeg" = ["org.xfce.ristretto.desktop"];
      "image/png" = ["org.xfce.ristretto.desktop"];
      "text/plain" = ["org.xfce.mousepad.desktop"];
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = ["onlyoffice-desktopeditors.desktop"];
      "application/vnd.openxmlformats-officedocument.presentationml.presentation" = ["onlyoffice-desktopeditors.desktop"];
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = ["onlyoffice-desktopeditors.desktop"];
    };
  };
}