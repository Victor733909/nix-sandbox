{
  description = "Environnement de développement Nix";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/6fcc160353f63555b560f25588925133c8f61f2a";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config = {};
        overlays = [];
      };
    in
    {
      devShells.${system}.default = pkgs.mkShellNoCC {
        packages = with pkgs; [
          vim
          cowsay
          lolcat
        ];

        GREETING = "Hello, Nix !";

        shellHook = ''
          echo "$GREETING" | cowsay | lolcat
        '';
      };
    };
}
