{host, config, ...}:
let
  fontName = config.desktop.style.font.name;
  fontSize = config.desktop.style.font.size;
  bkOne = config.theming.palette.bkOne;
  bkTwo = config.theming.palette.bkTwo;
  bkThree = config.theming.palette.bkThree;
  bkFour = config.theming.palette.bkFour;
  txOne = config.theming.palette.txOne;
  txTwo = config.theming.palette.txTwo;
  txThree = config.theming.palette.txThree;
in
{
  services.swaync.settings.style =
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
      background: #${bkTwo};
    }
    scale trough
    {
      margin: 0rem 1rem;
      background-color: #${bkTwo};
      min-height: 8px;
      min-width: 70px;
    }
    .floating-notifications.background .notification-row .notification-background
    {
      border-radius: 0px;
      margin: 18px;
      background-color: #${bkOne};
      color: #${txOne};
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
      color: #${txOne};
    }
    .floating-notifications.background .notification-row .notification-background .notification .notification-content .time
    {
      color: #${txOne};
    }
    .floating-notifications.background .notification-row .notification-background .notification .notification-content .body
    {
      color: #${txOne};
    }
    .floating-notifications.background .notification-row .notification-background .notification > *:last-child > *
    {
      min-height: 3.4em;
    }
    .floating-notifications.background .notification-row .notification-background .notification > *:last-child > * .notification-action
    {
      border: none;
      color: #${txOne};
      background-color: #${bkOne};
      margin: 7px;
    }
    .floating-notifications.background .notification-row .notification-background .notification > *:last-child > * .notification-action:hover
    {
      color: #${txThree};
      background-color: #${bkThree};
    }
    .floating-notifications.background .notification-row .notification-background .notification > *:last-child > * .notification-action:active
    {
      color: #${txTwo};
      background-color: #${bkTwo};
    }
    .floating-notifications.background .notification-row .notification-background .close-button
    {
      margin: 7px;
      padding: 2px;
      border-radius: 6.3px;
      color: #${txOne};
      background-color: #${bkOne};
    }
    .floating-notifications.background .notification-row .notification-background .close-button:hover
    {
      color: #${txThree};
      background-color: #${bkThree};
    }
    .floating-notifications.background .notification-row .notification-background .close-button:active
    {
      color: #${txTwo};
      background-color: #${bkTwo};
    }
    .control-center
    {
      border-radius: 0px;
      background-color: #${bkOne};
      color: #${txOne};
      padding: 14px;
    }
    .control-center .widget-title > label
    {
      color: #${txOne};
      font-size: 1.3em;
    }
    .control-center .widget-title button
    {
      border-radius: 7px;
      color: #${txOne};
      background-color: #${bkOne};
      padding: 8px;
    }
    .control-center .widget-title button:hover
    {
      color: #${txThree};
      background-color: #${bkThree};
    }
    .control-center .widget-title button:active
    {
      color: #${txTwo};
      background-color: #${bkTwo};
    }
    .control-center .notification-row .notification-background
    {
      border-radius: 7px;
      color: #${txOne};
      background-color: #${bkTwo};
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
      color: #${txOne};
    }
    .control-center .notification-row .notification-background .notification .notification-content .time
    {
      color: #${txTwo};;
    }
    .control-center .notification-row .notification-background .notification .notification-content .body
    {
      color: #${txOne};
    }
    .control-center .notification-row .notification-background .notification > *:last-child > *
    {
      min-height: 3.4em;
    }
    .control-center .notification-row .notification-background .notification > *:last-child > * .notification-action
    {
      border-radius: 7px;
      color: #${txTwo};
      background-color: #${bkTwo};
      margin: 7px;
    }
    .control-center .notification-row .notification-background .notification > *:last-child > * .notification-action:hover
    {
      color: #${txTwo};
      background-color: #${bkThree};
    }
    .control-center .notification-row .notification-background .notification > *:last-child > * .notification-action:active
    {
      color: #${txTwo};
      background-color: #${bkTwo};
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
      color: #${txTwo};
      background-color: #${bkTwo};
    }
    .control-center .notification-row .notification-background .close-button:hover
    {
      color: #${txTwo};
      background-color: #${bkThree};
    }
    .control-center .notification-row .notification-background .close-button:active
    {
      color: #${txTwo};
      background-color: #${bkTwo};
    }
    .control-center .notification-row .notification-background:hover
    {
      color: #${txTwo};
      background-color: #${bkTwo};
    }
    .control-center .notification-row .notification-background:active
    {
      color: #${txTwo};
      background-color: #${bkTwo};
    }
    .notification.critical progress
    {
      background-color: #${bkFour};
    }
    .notification.low progress,
    .notification.normal progress
    {
      background-color: #${bkTwo};
    }
    .control-center-dnd
    {
      margin-top: 5px;
      border-radius: 8px;
      background: #${bkOne};
      border: 1px solid #${bkTwo};
    }
    .control-center-dnd:checked
    {
      background: #${bkTwo};
    }
    .control-center-dnd slider
    {
      background: #${bkOne};
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
      background: #${bkTwo};
      border: 1px solid #${bkTwo};
    }
    .widget-dnd > switch:checked
    {
      background: #${bkTwo};
    }
    .widget-dnd > switch slider
    {
      background: #${bkThree};
      border-radius: 8px;
      border: 1px solid #${bkTwo};
    }
    .widget-mpris .widget-mpris-player
    {
      background: #${bkOne};
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
}