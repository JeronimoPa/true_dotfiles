{pkgs,lib, ...}:
{
	environment.sessionVariables = {
		PATH = [ "$HOME/.local/bin" ];
	};
	services.syncthing = {
		dataDir = "/home/jeronimo";
		enable = true;
		user = "jeronimo";
	};
	nixpkgs.config.permittedInsecurePackages = [
                "electron-39.8.10"
              ];
	networking.networkmanager.enable = true;
	networking.firewall.allowedTCPPorts = [ 8384 ];
	nixpkgs.config.allowUnfree = true;
	hardware.firmware = [pkgs.linux-firmware];

	#services.gnome.gnome-keyring.enable = true;
	#programs.ssh.startAgent = true;
	programs.tmux={
		enable = true;
		baseIndex = 1;
		terminal = "screen-256color";
		shortcut = "a";
		package = pkgs.tmux;
	};
	programs.gnupg.agent = {
		enable = true;
		enableSSHSupport = false;
	};
	services.ratbagd.enable = true;
	security.polkit.enable = true;
	

	xdg.mime.defaultApplications = {
		"text/html" = 				"firefox.desktop";
		"x-scheme-handler/http" = 	"firefox.desktop";
		"x-scheme-handler/https" = 	"firefox.desktop";
		"application/pdf" =			"firefox.desktop";
		#"image" = 					"desktop";
		"video/mp4" = 				"vlc.desktop";
      	"inode/directory" = [ "thunar.desktop" ];
	};



	environment.systemPackages = with pkgs; [

		openssl

		piper
		networkmanagerapplet
		python314
		python314Packages.dbus-python
		tmuxinator

		impala
		unzip

		seahorse


		xclip

		starship

		alsa-utils

		libreoffice

		tree
		#neovim
		parsec-bin
		#clases 
		home-manager
		#entornos de desarrollo
		vscodium

		#git cabrón
		git

		#c y c++
		gcc


		#tomar notas
		obsidian

		#git
		lazygit

		#tor
		tor-browser

		#music
		vlc

		#discord
		discord

		#audio control
		pavucontrol

		# C#
		dotnet-sdk

		#python
		##python312

		#descomprimir rar
		unrar

		#acceder al movil
		scrcpy

		#comics
		mcomix

		exiftool
		yt-dlp

		#java
		jdk

		#streaming
		obs-studio

		p7zip

		wireguard-tools
	];
	networking.firewall.checkReversePath = "loose";
	services.emacs.enable = true;

	#fucking firefox
	programs.firefox=
	{
		enable = true;

		policies = {
			ExtensionSettings = {
				"uBlock0@raymondhill.net" = {
					installation_mode = "force_installed";
					install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
				};
				"jid1-MnnxcxisBPnSXQ@jetpack" = {
					installation_mode = "force_installed";
					install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
				};
				"{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
					installation_mode = "force_installed";
					install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
				};
			};
		};

		preferencesStatus = "locked";
		preferences = {
# Interfaz
			"browser.tabs.inTitlebar" = 0;
			"browser.theme.toolbar-theme" = 0;
			"sidebar.revamp" = true;
			"sidebar.verticalTabs" = true;
			"sidebar.visibility" = "expand-on-hover";
			"accessibility.typeaheadfind.flashBar" = 0;

# IA / ML desactivado
			"browser.ai.control.default" = "blocked";
			"browser.ai.control.linkPreviewKeyPoints" = "blocked";
			"browser.ai.control.pdfjsAltText" = "blocked";
			"browser.ai.control.sidebarChatbot" = "blocked";
			"browser.ai.control.smartTabGroups" = "blocked";
			"browser.ai.control.smartWindow" = "blocked";
			"browser.ai.control.translations" = "available";
			"browser.ml.chat.enabled" = false;
			"browser.ml.chat.page" = false;
			"browser.ml.linkPreview.enabled" = false;
			"browser.tabs.groups.smart.enabled" = false;
			"browser.tabs.groups.smart.userEnabled" = false;
			"browser.smartwindow.memories.generateFromConversation" = false;
			"browser.smartwindow.memories.generateFromHistory" = false;
			"extensions.ml.enabled" = false;
			"pdfjs.enableAltText" = false;

# Privacidad
			"network.dns.disablePrefetch" = true;
			"network.prefetch-next" = false;
			"network.http.speculative-parallel-limit" = 0;
			"privacy.clearOnShutdown_v2.formdata" = true;
			"signon.rememberSignons" = false; # usas gestor externo (Bitwarden)

# Varios
				"extensions.pictureinpicture.enable_picture_in_picture_overrides" = true;
		};
	};
	services.printing.enable = true;

# Enable sound with pipewire.
	services.pulseaudio.enable = false;
	security.rtkit.enable = true;
	services.pipewire = {
		audio.enable = true;
		enable = true;
		jack.enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
		wireplumber.enable = true;
	};
# Auto-mute en alsa desactivado
#services.xserver.desktopManager.xfce.enable = true;
# Enable touchpad support (enabled default in most desktopManager).
# services.xserver.libinput.enable = true;

#nerdfonts para las apps
#fonts.packages = with pkgs; [ nerdfonts ];
	fonts.packages = [] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
}
