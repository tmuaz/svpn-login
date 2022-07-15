# This an impure flake that needs to find linux_f5vpn.x86_64.deb at the repo root.
# Make sure that it does and do e.g.: nix run path:$(pwd) -- [arguments to svpn-login]
{
  description = "F5 SSL VPN Command-Line Client";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      packages.${system}.default =
        if !(builtins.pathExists ./linux_f5vpn.x86_64.deb) then
          throw "svpn-login needs linux_f5vpn.x86_64.deb"
        else
          pkgs.callPackage ./svpn-login.nix {
            pkgs = pkgs;
            svpn = ./linux_f5vpn.x86_64.deb;
          };
      overlay = final: prev: { svpn-login = ./svpn-login.nix; };
    };
}
