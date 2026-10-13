let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/archive/6fcc160353f63555b560f25588925133c8f61f2a.tar.gz";
  pkgs = import nixpkgs { config = {}; overlays = [];};
in
pkgs.mkShellNoCC {
  packages = with pkgs; [
    vim
    cowsay
    lolcat
  ];

  GREETING="Hello, Nix !";
  shellHook = ''
    echo $GREETING | cowsay | lolcat
  '';
}
