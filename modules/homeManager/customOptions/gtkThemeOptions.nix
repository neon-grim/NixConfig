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
      backgroundColorOne = lib.mkOption
      {
        type = lib.types.str;
        default = "";
      };
      backgroundColorTwo = lib.mkOption
      {
        type = lib.types.str;
        default = "";
      };
      backgroundColorThree = lib.mkOption
      {
        type = lib.types.str;
        default = "";
      };
      backgroundColorFour = lib.mkOption
      {
        type = lib.types.str;
        default = "";
      };
      backgroundColorFive = lib.mkOption
      {
        type = lib.types.str;
        default = "";
      };
      textColorOne = lib.mkOption
      {
        type = lib.types.str;
        default = "";
      };
      textColorTwo = lib.mkOption
      {
        type = lib.types.str;
        default = "";
      };
      textColorThree = lib.mkOption
      {
        type = lib.types.str;
        default = "";
      };
      textColorFour = lib.mkOption
      {
        type = lib.types.str;
        default = "";
      };
      textColorFive = lib.mkOption
      {
        type = lib.types.str;
        default = "";
      };
    };
  };
}