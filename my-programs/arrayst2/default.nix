{ stdenv, lib }:
stdenv.mkDerivation {
  pname = "arrayst";
  version = "0.0.1";

  src = ./.;

  buildPhase = ''
    gcc arrays-t1.c -o arrayst
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp arrayst $out/bin/"arrayst"
  '';
}   
