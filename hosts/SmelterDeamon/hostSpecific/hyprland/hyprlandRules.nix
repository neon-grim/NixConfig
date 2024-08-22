{
  windowRules = 
  [
    # Gaming
    "monitor DP-2, class:^(steam_app_.*)$"
    "workspace 20, class:^(steam_app_.*)$"
    "immediate, class:^(steam_app_.*)$"
    "fullscreen, class:^(steam_app_.*)$"
    # File-explorer
    "float, floeating:0, title:^([O-o]pen.*)$"
    "float, floeating:0, title:^([L-l]oad.*)$"
    "float, floeating:0, title:^([S-s]ave.*)$"
    "center 1, floeating:1, title:^(.*)$"
    "size 70% 70%, floeating:1, title:^(.*[O-o]pen.*)$"
    "size 70% 70%, floeating:1, title:^(.*[S-s]ave.*)$"
    "size 70% 70%, floeating:1, title:^(.*[L-l]oad.*)$"
    # Apps
    "monitor HDMI-A-2, class:^(vesktop)$"
    "monitor HDMI-A-1, title:^(Steam)$"
    
  ];
}