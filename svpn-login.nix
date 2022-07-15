{ pkgs, svpn }:

pkgs.stdenv.mkDerivation {
  name = "svpn-login";
  nativeBuildInputs = with pkgs; [ autoPatchelfHook dpkg makeWrapper ];
  buildInputs = with pkgs;
    [ (python39.withPackages (pythonPkgs: [ pythonPkgs.requests ])) ];
  unpackPhase = ":";
  installPhase = ''
    dpkg -x ${svpn} $out
    install -m755 -D $out/opt/f5/vpn/svpn $out/bin/svpn
    rm -rf $out/opt
    install -m755 -D ${./svpn-login.py} $out/bin/svpn-login
    wrapProgram $out/bin/svpn-login --prefix PATH : $out/bin
  '';
  meta.mainProgram = "svpn-login";
}
