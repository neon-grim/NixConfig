{host, ...}:
{
  imports =
  [
    ./swaync/swayncStyle.nix
  ];
  services.swaync =
  {
    enable = true;
    settings =
    {
      positionX = "right";
      positionY = "top";
      layer = "overlay";
      control-center-layer = "top";
      cssPriority = "user";
      image-visibility = "when-available";
      hide-on-clear = true;
      hide-on-action = true;
      widgets =
      [
        "title"
        "dnd"
        "mpris"
        "notifications"
      ];
      widget-config =
      {
        title =
      {
        text = "${host}";
        clear-all-button = true;
        button-text = "Clear";
      };
      dnd =
      {
        text = "Quiet";
      };
      label =
      {
        max-lines = 5;
        text = "Label Text";
      };
      mpris =
        {
          image-size = 96;
          image-radius = 12;
        };
      };
    };
  };
}