{lib, ...}:
{
  options =
  {
    theming =
    {
      gtk =
      {
        name = lib.mkOption
        {
          type = lib.types.str;
          default = "";
        };
        package = lib.mkOption
        {
          type = lib.types.str;
          default = "";
        };
      };
      palette =
      {
        bkOne = lib.mkOption
        {
          type = lib.types.str;
          default = "";
        };
        bkTwo = lib.mkOption
        {
          type = lib.types.str;
          default = "";
        };
        bkThree = lib.mkOption
        {
          type = lib.types.str;
          default = "";
        };
        bkFour = lib.mkOption
        {
          type = lib.types.str;
          default = "";
        };
        bkFive = lib.mkOption
        {
          type = lib.types.str;
          default = "";
        };
        txOne = lib.mkOption
        {
          type = lib.types.str;
          default = "";
        };
        txTwo = lib.mkOption
        {
          type = lib.types.str;
          default = "";
        };
        txThree = lib.mkOption
        {
          type = lib.types.str;
          default = "";
        };
        txFour = lib.mkOption
        {
          type = lib.types.str;
          default = "";
        };
        txFive = lib.mkOption
        {
          type = lib.types.str;
          default = "";
        };
      };
    };
  };
}