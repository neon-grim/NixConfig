{ config, lib, pkgs, ... }:
{
  services.hyprpaper = {
    enable = true;
    settings = 
    {
      splash = false;
      preload =
      [ 
        "/mnt/SATASSD1/1_Images/BackgroundImages/DE_Stomp.png"
        "/mnt/SATASSD1/1_Images/BackgroundImages/Death_OG.png" 
        "/mnt/SATASSD1/1_Images/BackgroundImages/Dusk.png"
        "/mnt/SATASSD1/1_Images/BackgroundImages/DE_Green.png"
        "/mnt/SATASSD1/1_Images/BackgroundImages/red_transistor.png"
        "/mnt/SATASSD1/1_Images/BackgroundImages/warhammer_march.png"
        "/mnt/SATASSD1/1_Images/BackgroundImages/warhammer_plasma.png"
        "/mnt/SATASSD1/1_Images/BackgroundImages/instrument.png"
        "/mnt/SATASSD1/1_Images/BackgroundImages/lady_maria.png"
        "/mnt/SATASSD1/1_Images/BackgroundImages/warhammer_war.png"
        "/mnt/SATASSD1/1_Images/BackgroundImages/Imperial_Aquilla.png"
      ];
      wallpaper = 
      [
        "DP-2,/mnt/SATASSD1/1_Images/BackgroundImages/DE_Stomp.png"
        "HDMI-A-1,/mnt/SATASSD1/1_Images/BackgroundImages/red_transistor.png"
        "HDMI-A-2,/mnt/SATASSD1/1_Images/BackgroundImages/instrument.png"
      ];
    };
  };
}