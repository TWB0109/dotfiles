{ config, pkgs, lib }:

pkgs.appimageTools.wrapType2 rec {

  pname = "cider";
  version = "2.3.1";
  src = ./cider.AppImage;

  extraInstallCommands = 
    let contents = pkgs.appimageTools.extract { inherit pname version src; };
    in ''
      mv $out/bin/${pname}-${version} $out/bin/${pname}
      
      install -m 444 -D ${contents}/${pname}.desktop -t $out/share/applications
      substituteInPlace $out/share/applications/${pname}.desktop \
        --replace 'Exec=AppRun' 'Exec=${pname}'
      cp -r ${contents}/usr/share/icons $out/share
    '';
    meta = with lib; {
      description = "A new look into listening and enjoying Apple Music in style and performance.";
      homepage = "https://cider.sh";
      platforms = [ "x86_64-linux" ];
    };
}
