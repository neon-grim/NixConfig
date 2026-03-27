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
        "application/pdf" = ["librewolf.desktop"];
        "x-scheme-handler/http" = ["librewolf.desktop"];
        "x-scheme-handler/https" = ["librewolf.desktop"];
        "audio/mp3" = ["org.gnome.Lollypop.desktop"];
        "audio/mp4" = ["org.gnome.Lollypop.desktop"];
        "audio/flac" = ["org.gnome.Lollypop.desktop"];
        "image/jpeg" = ["org.gnome.eog.desktop"];
        "image/png" = ["org.gnome.eog.desktop"];
        "inode/directory" = ["nemo.desktop"];
        "text/plain" = ["org.xfce.mousepad.desktop"];
        "video/mp4" = ["io.github.celluloid_player.Celluloid.desktop"];
        "video/x-matroska" = ["io.github.celluloid_player.Celluloid.desktop"];
        "video/webm" = ["io.github.celluloid_player.Celluloid.desktop"];
      };
    };
    userDirs = 
    {
      enable = true;
      createDirectories = true;
    };
  };
}