{pkgs, host, ...}:
let
  inherit (import ../../hosts/${host}/variables.nix)
    font
    fontSize;
in
{
  programs.terminator = 
  {
    enable = true;
    config =
    {
      global_config.borderless = true;
      profiles.default = 
      {
        font = "${font} ${toString fontSize}";
        use_system_font = false;
        allow_bold = true;
        background_darkness = 0.75;
        background_type = "transparent";
        use_theme_colors = true;
        show_titlebar = false;
        use_custom_command = true;
        custom_command = "fish";
      };
    };
  };
}