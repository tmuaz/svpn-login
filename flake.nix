# E.g. nix run path:$(pwd) -- [arguments to svpn-login]
{
  description = "F5 SSL VPN Command-Line Client";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in { packages.${system}.default = pkgs.callPackage ./svpn-login.nix { }; };
}
