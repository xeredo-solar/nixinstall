{ pkgs, lib }:

let
  distinstSrc = builtins.fromJSON (builtins.readFile ./distinst.json);
in
lib.makeScope pkgs.newScope (self: with self; {
  distinst = callPackage "${pkgs.fetchFromGitHub distinstSrc}/package.nix" {};
  nixinstall = callPackage ./nixinstall.nix { };
})
