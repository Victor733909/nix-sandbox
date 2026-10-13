let
  pkgs = import <nixpkgs> {};
in
pkgs.callPackage ./hello.nix {
  inherit pkgs;
}
