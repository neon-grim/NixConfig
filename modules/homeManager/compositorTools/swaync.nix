{host, config, ...}:
let
  fontName = config.desktop.style.font.name;
  fontSize = config.desktop.style.font.size;
in
{
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
    style =
    ''
      *
      {
        all: unset;
        font-family: "${fontName}";
        font-size: ${toString fontSize}pt;
        transition-duration: 0.1s;
        box-shadow: none;
      }
      trough highlight
      {
        background: #${config.theming.palette.bkTwo};
      }
      scale trough
      {
        margin: 0rem 1rem;
        background-color: #${config.theming.palette.bkTwo};
        min-height: 8px;
        min-width: 70px;
      }
      .floating-notifications.background .notification-row .notification-background
      {
        border-radius: 0px;
        margin: 18px;
        background-color: #${config.theming.palette.bkOne};
        color: #${config.theming.palette.txOne};
        padding: 0;
      }
      .floating-notifications.background .notification-row .notification-background .notification
      {
        padding: 7px;
        border-radius: 12.6px;
      }
      .floating-notifications.background .notification-row .notification-background .notification .notification-content
      {
        margin: 7px;
      }
      .floating-notifications.background .notification-row .notification-background .notification .notification-content .summary
      {
        color: #${config.theming.palette.txOne};
      }
      .floating-notifications.background .notification-row .notification-background .notification .notification-content .time
      {
        color: #${config.theming.palette.txOne};
      }
      .floating-notifications.background .notification-row .notification-background .notification .notification-content .body
      {
        color: #${config.theming.palette.txOne};
      }
      .floating-notifications.background .notification-row .notification-background .notification > *:last-child > *
      {
        min-height: 3.4em;
      }
      .floating-notifications.background .notification-row .notification-background .notification > *:last-child > * .notification-action
      {
        border: none;
        color: #${config.theming.palette.txOne};
        background-color: #${config.theming.palette.bkOne};
        margin: 7px;
      }
      .floating-notifications.background .notification-row .notification-background .notification > *:last-child > * .notification-action:hover
      {
        color: #${config.theming.palette.txThree};
        background-color: #${config.theming.palette.bkThree};
      }
      .floating-notifications.background .notification-row .notification-background .notification > *:last-child > * .notification-action:active
      {
        color: #${config.theming.palette.txTwo};
        background-color: #${config.theming.palette.bkTwo};
      }
      .floating-notifications.background .notification-row .notification-background .close-button
      {
        margin: 7px;
        padding: 2px;
        border-radius: 6.3px;
        color: #${config.theming.palette.txOne};
        background-color: #${config.theming.palette.bkOne};
      }
      .floating-notifications.background .notification-row .notification-background .close-button:hover
      {
        color: #${config.theming.palette.txThree};
        background-color: #${config.theming.palette.bkThree};
      }
      .floating-notifications.background .notification-row .notification-background .close-button:active
      {
        color: #${config.theming.palette.txTwo};
        background-color: #${config.theming.palette.bkTwo};
      }
      .control-center
      {
        border-radius: 0px;
        background-color: #${config.theming.palette.bkOne};
        color: #${config.theming.palette.txOne};
        padding: 14px;
      }
      .control-center .widget-title > label
      {
        color: #${config.theming.palette.txOne};
        font-size: 1.3em;
      }
      .control-center .widget-title button
      {
        border-radius: 7px;
        color: #${config.theming.palette.txOne};
        background-color: #${config.theming.palette.bkOne};
        padding: 8px;
      }
      .control-center .widget-title button:hover
      {
        color: #${config.theming.palette.txThree};
        background-color: #${config.theming.palette.bkThree};
      }
      .control-center .widget-title button:active
      {
        color: #${config.theming.palette.txTwo};
        background-color: #${config.theming.palette.bkTwo};
      }
      .control-center .notification-row .notification-background
      {
        border-radius: 7px;
        color: #${config.theming.palette.txOne};
        background-color: #${config.theming.palette.bkTwo};
        margin-top: 14px;
      }
      .control-center .notification-row .notification-background .notification
      {
        padding: 7px;
        border-radius: 7px;
      }
      .control-center .notification-row .notification-background .notification .notification-content
      {
        margin: 7px;
      }
      .control-center .notification-row .notification-background .notification .notification-content .summary
      {
        color: #${config.theming.palette.txOne};
      }
      .control-center .notification-row .notification-background .notification .notification-content .time
      {
        color: #${config.theming.palette.txTwo};;
      }
      .control-center .notification-row .notification-background .notification .notification-content .body
      {
        color: #${config.theming.palette.txOne};
      }
      .control-center .notification-row .notification-background .notification > *:last-child > *
      {
        min-height: 3.4em;
      }
      .control-center .notification-row .notification-background .notification > *:last-child > * .notification-action
      {
        border-radius: 7px;
        color: #${config.theming.palette.txTwo};
        background-color: #${config.theming.palette.bkTwo};
        margin: 7px;
      }
      .control-center .notification-row .notification-background .notification > *:last-child > * .notification-action:hover
      {
        color: #${config.theming.palette.txTwo};
        background-color: #${config.theming.palette.bkThree};
      }
      .control-center .notification-row .notification-background .notification > *:last-child > * .notification-action:active
      {
        color: #${config.theming.palette.txTwo};
        background-color: #${config.theming.palette.bkTwo};
      }
      .close-button
      {
        border-radius: 6.3px;
        margin-bottom: 10px;
      }
      .control-center .notification-row .notification-background .close-button
      {
        margin: 7px;
        padding: 2px;
        border-radius: 6.3px;
        color: #${config.theming.palette.txTwo};
        background-color: #${config.theming.palette.bkTwo};
      }
      .control-center .notification-row .notification-background .close-button:hover
      {
        color: #${config.theming.palette.txTwo};
        background-color: #${config.theming.palette.bkThree};
      }
      .control-center .notification-row .notification-background .close-button:active
      {
        color: #${config.theming.palette.txTwo};
        background-color: #${config.theming.palette.bkTwo};
      }
      .control-center .notification-row .notification-background:hover
      {
        color: #${config.theming.palette.txTwo};
        background-color: #${config.theming.palette.bkTwo};
      }
      .control-center .notification-row .notification-background:active
      {
        color: #${config.theming.palette.txTwo};
        background-color: #${config.theming.palette.bkTwo};
      }
      .notification.critical progress
      {
        background-color: #${config.theming.palette.bkFour};
      }
      .notification.low progress,
      .notification.normal progress
      {
        background-color: #${config.theming.palette.bkTwo};
      }
      .control-center-dnd
      {
        margin-top: 5px;
        border-radius: 8px;
        background: #${config.theming.palette.bkOne};
        border: 1px solid #${config.theming.palette.bkTwo};
      }
      .control-center-dnd:checked
      {
        background: #${config.theming.palette.bkTwo};
      }
      .control-center-dnd slider
      {
        background: #${config.theming.palette.bkOne};
        border-radius: 8px;
      }
      .widget-dnd
      {
        margin: 0px;
        font-size: 1.1rem;
      }
      .widget-dnd > switch
      {
        font-size: initial;
        border-radius: 8px;
        background: #${config.theming.palette.bkTwo};
        border: 1px solid #${config.theming.palette.bkTwo};
      }
      .widget-dnd > switch:checked
      {
        background: #${config.theming.palette.bkTwo};
      }
      .widget-dnd > switch slider
      {
        background: #${config.theming.palette.bkThree};
        border-radius: 8px;
        border: 1px solid #${config.theming.palette.bkTwo};
      }
      .widget-mpris .widget-mpris-player
      {
        background: #${config.theming.palette.bkOne};
        padding: 7px;
        margin-top: 7px;
      }
      .widget-mpris .widget-mpris-title
      {
        font-size: 1.2rem;
      }
      .widget-mpris .widget-mpris-subtitle
      {
        font-size: 0.8rem;
      }
      .image
      {
        padding-right: 0.5rem;
      }
    '';
  };
}