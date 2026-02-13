{pkgs, config, ...}:
{
        #programs.bash.shellAliases = {
        #	"Practicas_BD"="mysql -h giibd.uca.es -u BD2425_u32912011 -p BD_tiendas";
        #};

  environment.systemPackages = with pkgs; [
  	(writeShellScriptBin "Descargar_Música" ''
    		param1=$1 #URL
    		param2=$2 #Autor
    		param3=$3 #Album
		
		mkdir -p "$HOME/Música/$param3"
    		
		yt-dlp -x --audio-format mp3 --add-metadata --embed-thumbnail \
      		--autonumber-start 1 --cookies-from-browser firefox \
      		-o "$HOME/Música/$param3/[%(autonumber)02d]+ %(title)s.%(ext)s" "$param1";
			
		nix-shell -p python312Packages.mutagen --run "python3 ~/musica.py '$param2' '$param3'"

  '')
];
}
