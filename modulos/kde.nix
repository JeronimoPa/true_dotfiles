{pkgs, lib,...}:
{
	services.desktopManager.plasma6.enable = true;
	environment.plasma6.excludePackages = with pkgs; [
		kdePackages.akonadi # PIM storage service
		kdePackages.akregator # RSS reader
		kdePackages.elisa # Music player
		kdePackages.kaddressbook # Address book
		kdePackages.kalarm # Alarm and timer app
		kdePackages.kdepim-runtime # Akonadi agents and resources
		kdePackages.khelpcenter # Software documentation viewer
		kdePackages.kmahjongg # Tile matching game
		kdePackages.kmail # Email client
		kdePackages.kmines # Minesweeper game
		kdePackages.kontact # Container app to unify KDE PIM apps
		kdePackages.konversation # IRC client
		kdePackages.korganizer # Calendars and similar functionality
		kdePackages.kpat # Solitaire card games
		kdePackages.ksudoku # Logic puzzle
		kdePackages.ksystemlog # KDE SystemLog Application
		kdePackages.ktorrent # BitTorrent client
		kdePackages.plasma-browser-integration # Integrate browsers into the Plasma Desktop
		kdePackages.qrca # QR code scanner for Plasma Mobile
		mpv
		kdePackages.aurorae
		kdePackages.plasma-browser-integration
		kdePackages.plasma-workspace-wallpapers
		kdePackages.konsole
		kdePackages.kwin-x11
		#(lib.getBin qttools) # Expose qdbus in PATH
		kdePackages.ark
		kdePackages.elisa
		kdePackages.gwenview
		kdePackages.okular
		kdePackages.kate
		kdePackages.ktexteditor # provides elevated actions for kate
		kdePackages.khelpcenter
		kdePackages.dolphin
		kdePackages.baloo-widgets # baloo information in Dolphin
		kdePackages.dolphin-plugins
		kdePackages.spectacle
		kdePackages.ffmpegthumbs
		kdePackages.krdp
	];
}
