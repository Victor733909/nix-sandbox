let
  pkgs = import <nixpkgs> {};
in
import ./hello.nix { inherit pkgs; }
