{ stdenv
, substituteAll
, meson
, ninja
, vala
, gtk3
, pkgconfig
, distinst
, desktop-file-utils
, gettext
, libgnomekbd
, pantheon
, libgee
, glib
, json-glib
, libpwquality
, libxml2
, gparted
, wrapGAppsHook
, isocodes
, xkeyboard_config
, slideshowPackage ? false
}:

stdenv.mkDerivation rec {
  pname = "nixinstall";
  version = "0.0.1";

  src = stdenv.lib.cleanSource ./..;

  patches = [
    (substituteAll {
      src = ./fix-paths.patch;
      gparted = "${gparted}/bin/gparted";
    })
  ];

  nativeBuildInputs = [
    desktop-file-utils
    gettext
    meson
    ninja
    pkgconfig
    vala
    wrapGAppsHook
  ];

  buildInputs = [
    distinst
    glib
    gtk3
    isocodes
    json-glib
    libgee
    libgnomekbd
    libpwquality
    libxml2
    pantheon.granite
    xkeyboard_config
  ];

  doCheck = true;

  meta = with stdenv.lib; {
    description = "NixOS Installer based on the elementary OS installer";
    homepage = "https://github.com/ssd-solar/nixinstall";
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [ worldofpeace mkg20001 ];
    platforms = platforms.linux;
  };
}
