{ lib
, stdenvNoCC
, fetchFromGitHub
, gtk3
, hicolor-icon-theme
, jdupes
}:

stdenvNoCC.mkDerivation rec
{
  pname = "BeautySolar";
  version = "bd0cc05d974dcef6fe0a163c96c6ecad5c58f225";
  
  src = fetchFromGitHub 
  {
    owner = "SeekerOfAsh";
    repo = pname;
    rev = version;
    sha256 = "sha256-BA3fmMh6hSg8jeqEeAGix5JPU/BLz3OtmdoOVxfGsdw=";
  };
  
  nativeBuildInputs = [ jdupes gtk3 ];
  
  buildInputs = [ hicolor-icon-theme ];
  
  dontPatchELF = true;
  dontRewriteSymlinks = true;
  dontDropIconThemeCache = true;
  
  installPhase = 
  ''
    runHook preInstall
    
    mkdir -p $out/share/icons/${pname}
    cp -r $src/BeautySolar_V1/* $out/share/icons/${pname}/

    jdupes --link-soft --recurse $out/share

    runHook postInstall
    ''
  ;

  meta = with lib; {
    description = "BeautySolar icon theme";
    homepage = "https://www.gnome-look.org/p/2037657";
    platforms = platforms.linux;
    license = [ licenses.publicDomain ];
  };
}