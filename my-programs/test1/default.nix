{ stdenv, lib }:
stdenv.mkDerivation {
  pname = "helloworld";
  version = "0.0.1";

  src = ./.;

  buildPhase = ''
    gcc main.c -o helloworld
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp helloworld $out/bin/helloworld
  '';
}   
