{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "svpn-login";
  nativeBuildInputs = [ pkgs.dpkg pkgs.autoPatchelfHook ];
  buildInputs = with pkgs; [ (python37.withPackages (ps: [ps.requests])) ];
  unpackPhase = ":";
  installPhase = ''
    dpkg -x ${./linux_f5vpn.x86_64.deb} $out
    install -m755 -D $out/opt/f5/vpn/svpn $out/bin/svpn
    rm -rf $out/opt
    install -m755 -D ${./svpn-login.py} $out/bin/svpn-login
  '';
}
