#!/bin/bash

cd nix
nix run nixpkgs.nix-prefetch-github -c nix-prefetch-github mercode-org distinst > distinst.json
