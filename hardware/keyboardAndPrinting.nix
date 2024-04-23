{
  # configure keymap in X11
  services.xserver.xkb = 
  {
    layout = "ch";
    variant = "de_nodeadkeys";
  };

  # configure console keymap
  console.keyMap = "sg";

  # enable CUPS to print documents.
  services.printing.enable = true;
}
