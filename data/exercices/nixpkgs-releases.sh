#!/usr/bin/env nix-shell
#! nix-shell -i bash --pure
#! nix-shell -p bash cacert curl jq python3Packages.xmljson
#! nix-shell -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/6fcc160353f63555b560f25588925133c8f61f2a.tar.gz

curl https://github.com/NixOS/nixpkgs/releases.atom | xml2json | jq .
