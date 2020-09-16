# nix-shell --command "[svpn-login command]"

{ pkgs ? import <nixpkgs> {} }:

pkgs.callPackage ./svpn-login.nix {}
