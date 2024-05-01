{ lib, stdenv, fetchFromGitHub, kernel }:

stdenv.mkDerivation rec {
  # meta data
	pname = "xpad-noone";
	version = "v1.0";
	# package source
	src = fetchFromGitHub {
		owner = "SeekerOfAsh";
		repo = "xpad-noone-azeron";
		rev = "a42297dc1f64e4ec5e2a9430e8861bf93f8f69a2";
		sha256 = "sha256-1BrJz4IYfTXRo5xuqG25IrKgsPbVfgeX5OiAfvIxibY=";
	};
	setSourceRoot = ''
		export sourceRoot=$(pwd)/source
	'';
  # build config
	nativeBuildInputs = kernel.moduleBuildDependencies;
	makeFlags = kernel.makeFlags ++ [
		"-C"
		"${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"
		"M=$(sourceRoot)"
	];
	buildFlags = [ "modules" ];
	# install config
	installFlags = [ "INSTALL_MOD_PATH=${placeholder "out"}" ];
	installTargets = [ "modules_install" ];
	# additonal meta data
	meta = with lib; {
		description = "xpad kernel module with azeron support";
		homepage = "https://github.com/SeekerOfAsh/xpad-noone-azeron";
		license = licenses.gpl2Plus;
		platforms = platforms.linux;
	};
}
