let
  solaros = (builtins.fetchTarball https://nix.ssd-solar.dev/dev/solaros/nixexprs.tar.xz);
  solarnixpkgs = (builtins.fetchTarball https://nix.ssd-solar.dev/dev/nixpkgs/nixexprs.tar.xz);
in
with (import "${solaros}/dev.nix");
let
  out = callPackage ./nix { };
in
  out // {
    nixinstall = out.nixinstall.overrideAttrs(a: a // { shellHook = ''
      export NIX_PATH="solaros=${solaros}:nixpkgs=${solarnixpkgs}"
    ''; });
  }
