{...}:
{
  environment.sessionVariables =
  {
    # General system variables
    NIXOS_OZONE_WL = 1;
    # User dirs
    XDG_DESKTOP_DIR = "$HOME/Desktop";
    XDG_DOCUMENTS_DIR = "$HOME/Documents";
    XDG_DOWNLOAD_DIR = "$HOME/Downloads";
    XDG_MUSIC_DIR = "$HOME/Music";
    XDG_PICTURES_DIR = "$HOME/Pictures";
    XDG_PUBLICSHARE_DIR = "$HOME/Public";
    XDG_TEMPLATES_DIR = "$HOME/Templates";
    XDG_VIDEOS_DIR = "$HOME/Videos";
    # Config dirs
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
    # Unified Shader directory
    DXVK_STATE_CACHE_PATH = "$XDG_CACHE_HOME/ProtonShaders/DXVK";
    VKD3D_SHADER_CACHE_PATH = "$XDG_CACHE_HOME/ProtonShaders/VKD3D";
  };
}