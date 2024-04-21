{
  # Configure keymap in X11
  services.xserver.xkb = 
  {
    layout = "ch";
    variant = "de_nodeadkeys";
  };

  # Configure console keymap
  console.keyMap = "sg";

  # Enable CUPS to print documents.
  services.printing.enable = true;
}
