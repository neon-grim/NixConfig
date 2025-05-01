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
        "audio/mp3" = ["com.github.neithern.g4music.desktop"];
        "audio/flac" = ["com.github.neithern.g4music.desktop"];
        "image/jpeg" = ["com.github.weclaw1.ImageRoll.desktop"];
        "image/png" = ["com.github.weclaw1.ImageRoll.desktop"];
        "inode/directory" = ["nemo.desktop"];
        "text/plain" = ["org.xfce.mousepad.desktop"];
        "video/mp4" = ["vlc.desktop"];
        "video/mkv" = ["vlc.desktop"];
        "x-scheme-handler/http" = ["librewolf.desktop"];
        "x-scheme-handler/https" = ["librewolf.desktop"];
      };
    };
    userDirs = 
    {
      enable = true;
      createDirectories = true;
    };
  };
}