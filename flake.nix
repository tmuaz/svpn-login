# This an impure flake that needs to find linux_f5vpn.x86_64.deb at the repo root.
# Make sure that it does and do e.g.: nix run path:$(pwd) -- [arguments to svpn-login]
{
  description = "F5 SSL VPN Command-Line Client";

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      packages.${system}.default = pkgs.callPackage ./svpn-login.nix {
        pkgs = pkgs;
        svpn = pkgs.fetchurl {
          url = "https://itservicedesk.bham.ac.uk/sys_attachment.do?sys_id=242546471bc07610191a9978b04bcb82&view=true";
          hash = "sha256-qWa4UlEFQau+gy9u4PYpfipCFTVUu9pk3QXY9xb4318=";
        };
      };
      overlay = final: prev: { svpn-login = ./svpn-login.nix; };
    };
}
