{ pkgs ? import <nixpkgs> {} }:

pkgs.callPackage ./svpn-login.nix {}
