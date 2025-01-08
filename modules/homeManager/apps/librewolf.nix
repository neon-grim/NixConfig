{...}:
{
  programs.librewolf =
  {
    enable = true;
    settings =
    {
      "privacy.clearOnShutdown.history" = false;
      "privacy.clearOnShutdown.cookies" = false;
      "identity.fxaccounts.enabled" = true;
      "sidebar.revamp" = true;
      "sidebar.verticalTabs" = true;
    };
  };
}