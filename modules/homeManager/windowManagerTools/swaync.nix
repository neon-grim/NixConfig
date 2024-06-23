{host, ...}:
let
  inherit (import ../../../hosts/${host}/hostSpecific/themingConfig.nix)
    backgroundColorOne
    backgroundColorTwo
    backgroundColorThree
    backgroundColorFour
    textColorOne
    textColorTwo
    textColorThree
    textColorFour
    font
    fontSize;
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
	    widget-config = {
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
      * {
        all: unset;
        font-family: "${font}";
        font-size: ${toString fontSize}pt;
        transition-duration: 0.1s;
        box-shadow: none;
      }

      trough highlight {
        background: #${backgroundColorTwo};
      }
      
      scale trough {
        margin: 0rem 1rem;
        background-color: #${backgroundColorTwo};
        min-height: 8px;
        min-width: 70px;
      }
      
      .floating-notifications.background .notification-row .notification-background {
        border-radius: 0px;
        margin: 18px;
        background-color: #${backgroundColorOne};
        color: #${textColorOne};
        padding: 0;
      }

      .floating-notifications.background .notification-row .notification-background .notification {
        padding: 7px;
        border-radius: 12.6px;
      }

      .floating-notifications.background .notification-row .notification-background .notification .notification-content {
        margin: 7px;
      }

      .floating-notifications.background .notification-row .notification-background .notification .notification-content .summary {
        color: #${textColorOne};
      }

      .floating-notifications.background .notification-row .notification-background .notification .notification-content .time {
        color: #${textColorOne};
      }

      .floating-notifications.background .notification-row .notification-background .notification .notification-content .body {
        color: #${textColorOne};
      }

      .floating-notifications.background .notification-row .notification-background .notification > *:last-child > * {
        min-height: 3.4em;
      }

      .floating-notifications.background .notification-row .notification-background .notification > *:last-child > * .notification-action {
        border: none;
        color: #${textColorOne};
        background-color: #${backgroundColorOne};
        margin: 7px;
      }

      .floating-notifications.background .notification-row .notification-background .notification > *:last-child > * .notification-action:hover {
        color: #${textColorThree};
        background-color: #${backgroundColorThree};
      }

      .floating-notifications.background .notification-row .notification-background .notification > *:last-child > * .notification-action:active {
        color: #${textColorTwo};
        background-color: #${backgroundColorTwo};
      }

      .floating-notifications.background .notification-row .notification-background .close-button {
        margin: 7px;
        padding: 2px;
        border-radius: 6.3px;
        color: #${textColorOne};
        background-color: #${backgroundColorOne};
      }

      .floating-notifications.background .notification-row .notification-background .close-button:hover {
        color: #${textColorThree};
        background-color: #${backgroundColorThree};
      }

      .floating-notifications.background .notification-row .notification-background .close-button:active {
        color: #${textColorTwo};
        background-color: #${backgroundColorTwo};
      }

      .control-center {
        border-radius: 0px;
        background-color: #${backgroundColorOne};
        color: #${textColorOne};
        padding: 14px;
      }

      .control-center .widget-title > label {
        color: #${textColorOne};
        font-size: 1.3em;
      }

      .control-center .widget-title button {
        border-radius: 7px;
        color: #${textColorOne};
        background-color: #${backgroundColorOne};
        padding: 8px;
      }

      .control-center .widget-title button:hover {
        color: #${textColorThree};
        background-color: #${backgroundColorThree};
      }

      .control-center .widget-title button:active {
        color: #${textColorTwo};
        background-color: #${backgroundColorTwo};
      }

      .control-center .notification-row .notification-background {
        border-radius: 7px;
        color: #${textColorOne};
        background-color: #${backgroundColorTwo};
        margin-top: 14px;
      }

      .control-center .notification-row .notification-background .notification {
        padding: 7px;
        border-radius: 7px;
      }

      .control-center .notification-row .notification-background .notification .notification-content {
        margin: 7px;
      }

      .control-center .notification-row .notification-background .notification .notification-content .summary {
        color: #${textColorOne};
      }

      .control-center .notification-row .notification-background .notification .notification-content .time {
        color: #${textColorTwo};;
      }

      .control-center .notification-row .notification-background .notification .notification-content .body {
        color: #${textColorOne};
      }

      .control-center .notification-row .notification-background .notification > *:last-child > * {
        min-height: 3.4em;
      }

      .control-center .notification-row .notification-background .notification > *:last-child > * .notification-action {
        border-radius: 7px;
        color: #${textColorTwo};
        background-color: #${backgroundColorTwo};
        margin: 7px;
      }

      .control-center .notification-row .notification-background .notification > *:last-child > * .notification-action:hover {
        color: #${textColorTwo};
        background-color: #${backgroundColorThree};
      }

      .control-center .notification-row .notification-background .notification > *:last-child > * .notification-action:active {
        color: #${textColorTwo};
        background-color: #${backgroundColorTwo};
      }

      .close-button {
        border-radius: 6.3px;
        margin-bottom: 10px;
      }

      .control-center .notification-row .notification-background .close-button {
        margin: 7px;
        padding: 2px;
        border-radius: 6.3px;
        color: #${textColorTwo};
        background-color: #${backgroundColorTwo};
      }

      .control-center .notification-row .notification-background .close-button:hover {
        color: #${textColorTwo};
        background-color: #${backgroundColorThree};
      }

      .control-center .notification-row .notification-background .close-button:active {
        color: #${textColorTwo};
        background-color: #${backgroundColorTwo};
      }

      .control-center .notification-row .notification-background:hover {
        color: #${textColorTwo};
        background-color: #${backgroundColorTwo};
      }

      .control-center .notification-row .notification-background:active {
        color: #${textColorTwo};
        background-color: #${backgroundColorTwo};
      }

      .notification.critical progress {
        background-color: #${backgroundColorFour};
      }

      .notification.low progress,
      .notification.normal progress {
        background-color: #${backgroundColorTwo};
      }

      .control-center-dnd {
        margin-top: 5px;
        border-radius: 8px;
        background: #${backgroundColorOne};
        border: 1px solid #${backgroundColorTwo};
      }

      .control-center-dnd:checked {
        background: #${backgroundColorTwo};
      }

      .control-center-dnd slider {
        background: #${backgroundColorOne};
        border-radius: 8px;
      }

      .widget-dnd {
        margin: 0px;
        font-size: 1.1rem;
      }

      .widget-dnd > switch {
        font-size: initial;
        border-radius: 8px;
        background: #${backgroundColorTwo};
        border: 1px solid #${backgroundColorTwo};
      }

      .widget-dnd > switch:checked {
        background: #${backgroundColorTwo};
      }

      .widget-dnd > switch slider {
        background: #${backgroundColorThree};
        border-radius: 8px;
        border: 1px solid #${backgroundColorTwo};
      }

      .widget-mpris .widget-mpris-player {
        background: #${backgroundColorOne};
        padding: 7px;
        margin-top: 7px;
      }

      .widget-mpris .widget-mpris-title {
        font-size: 1.2rem;
      }

      .widget-mpris .widget-mpris-subtitle {
        font-size: 0.8rem;
      }
      
      .image {
        padding-right: 0.5rem;
      }
    '';
  };
}