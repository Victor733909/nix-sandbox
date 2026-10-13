#{ pkgs ? import <nixpkgs> {} }:
{ pkgs }:

pkgs.mkShell {
  packages = with pkgs; [
    cowsay
    lolcat
  ];

  GREETING="Hello, Nix !";
  shellHook = ''
  echo $GREETING | cowsay | lolcat
  '';
}
