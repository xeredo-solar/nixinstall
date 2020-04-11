{ stdenv
, meson
, ninja
, vala
, gtk3
, pkgconfig
, cmake
, distinst
, desktop-file-utils
, gettext
, libgnomekbd
, pantheon
, libgee
, glib
, gobject-introspection
, json-glib
, libpwquality
, libxml2
, wrapGAppsHook
}:


stdenv.mkDerivation rec {
  pname = "nixinstall";
  version = "0.0.1";

  src = ./..;

  nativeBuildInputs = [
    meson
    desktop-file-utils
    gettext
    ninja
    pkgconfig
    cmake
    wrapGAppsHook
  ];

  buildInputs = [
    pantheon.granite
    glib
    json-glib
    gobject-introspection
    libpwquality
    libgnomekbd
    libxml2
    vala
    libgee
    gtk3
    distinst
  ];

  preConfigure = ''
    export LIBRARY_PATH="$LIBRARY_PATH:${libgnomekbd}/lib"
  '';

  shellHook = preConfigure;
}
