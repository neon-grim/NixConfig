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
        "application/pdf" = ["zen.desktop"];
        "audio/mp3" = ["org.gnome.Lollypop.desktop"];
        "audio/flac" = ["org.gnome.Lollypop.desktop"];
        "image/jpeg" = ["org.libvips.vipsdisp.desktop"];
        "image/png" = ["org.libvips.vipsdisp.desktop"];
        "text/plain" = ["org.xfce.mousepad.desktop"];
        "text/html" = ["zen.desktop"];
        "video/mp4" = ["io.github.celluloid_player.Celluloid.desktop"];
        "x-scheme-handler/http" = ["zen.desktop"];
        "x-scheme-handler/https" = ["zen.desktop"];
      };
    };
    userDirs = 
    {
      enable = true;
      createDirectories = true;
    };
  };
}