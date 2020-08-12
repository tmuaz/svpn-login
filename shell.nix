{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    (callPackage ./svpn-login.nix {})
  ];
}
