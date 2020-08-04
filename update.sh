#!/bin/bash

cd nix
nix run nixpkgs.nix-prefetch-github -c nix-prefetch-github ssd-solar distinst > distinst.json
