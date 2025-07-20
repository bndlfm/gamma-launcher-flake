{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    gamma-launcher.url = "github:Mord3rca/gamma-launcher";
  };
  outputs = {self, nixpkgs, ...}@inputs: let
      forAllSys = nixpkgs.lib.genAttrs nixpkgs.lib.platforms.all;
  in {
        packages = forAllSys (system:
            let
                pkgs = import nixpkgs { inherit system; };
                gamma-launcher = pkgs.callPackage ./. {};
            in {
                default = gamma-launcher;
            }
        );
    };
}
