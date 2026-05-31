{ stdenv, lib }:
stdenv.mkDerivation {
  pname = "sleepc";
  version = "0.0.1";

  src = ./.;

  buildPhase = ''
    gcc sleepc.c -o sleepc
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp sleepc $out/bin/sleepc
  '';
}   
