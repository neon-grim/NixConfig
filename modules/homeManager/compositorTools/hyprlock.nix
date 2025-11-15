{user, config, ...}:
let
  fontName = config.desktop.style.font.name;
  accentDefault = config.desktop.theming.palette.accentDefault;
  bkDefault = config.desktop.theming.palette.bkDefault;
  bkUrgent = config.desktop.theming.palette.bkUrgent;
  txDefault = config.desktop.theming.palette.txDefault;
  txBrightest = config.desktop.theming.palette.txBrightest;
in
{
  programs.hyprlock =
  {
    enable = true;
    settings =
    {
      general =
      {
        disable_loading_bar = false;
        hide_cursor = false;
      };
      label =
      [
        {
          text = ''cmd[update:30000] echo "$(date +"%R")"'';
          color = "rgb(${txDefault})";
          font_size = 80;
          font_family = "${fontName}";
          position = "0, 0";
          halign = "center";
          valign = "bottom";
          shadow_passes = 2;
        }
        {
          text = ''cmd[update:43200000] echo "$(date +"%A, %d %B %Y")"'';
          color = "rgb(${txDefault})";
          font_size = 25;
          font_family = "${fontName}";
          position = "0, 50";
          halign = "center";
          valign = "bottom";
          shadow_passes = 2;
        }
        {
          text = "Hi ${user}";
          text_align = "center";
          color = "rgb(${txDefault})";
          font_size = 25;
          font_family = "${fontName}";
          rotate = 0;
          position = "0, -100";
          halign = "center";
          valign = "center";
          shadow_passes = 2;
        } 
      ];
      image =
      {
        path = "/mnt/SATASSD1/1_Images/ProfilePic/Loverboy.png";
        size = 290;
        border_color = "rgb(${accentDefault})";
        rounding = -1;
        position = "0, 100";
        halign = "center";
        valign = "center";
        shadow_passes = 2;
      };
      input-field =
      {
        # Box appearance
        fade_on_empty = false;
        outline_thickness = 2;
        rounding = 5;
        size = "400, 50";
        halign = "center";
        valign = "center";
        position = "0, -150";
        # Dot settings
        dots_center = true;
        dots_size = 0.33;
        dots_spacing = 0.15;
        # Color Settings
        font_color = "rgb(${txDefault})";
        inner_color = "rgb(${bkDefault})";
        outer_color = "rgb(${accentDefault})";
        check_color = "rgb(${txBrightest})";
        fail_color = "rgb(${bkUrgent})";
      };
      shape =
      {
        size = "1000, 2570";
        color = "rgba(${bkDefault}d9)";
        rounding = 3;
        border_size = -1;
        rotate = 0;
        position = "0, 0";
        halign = "center";
        valign = "top";
      };
    };
  };
}