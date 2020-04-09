{ stdenv
, meson
, ninja
, vala
, gtk3
, pkgconfig
, cmake
, distinst
}:

stdenv.mkDerivation {
  pname = "nixinstall";
  version = "0.0.1";

  src = ./..;

  nativeBuildInputs = [
    meson
    ninja
    vala
    pkgconfig
    cmake
  ];

  buildInputs = [
    gtk3
    distinst
  ];
}
