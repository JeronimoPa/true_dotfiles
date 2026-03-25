{pkgs,lib, ...}:
{
	services.syncthing = {
  		dataDir = "/home/jeronimo";
  		enable = true;
  		user = "jeronimo";
	};
  networking.firewall.allowedTCPPorts = [ 8384 ];
  nixpkgs.config.allowUnfree = true;
  hardware.firmware = [pkgs.linux-firmware];
  
	#services.gnome.gnome-keyring.enable = true;
  security.pam.services.login.enableGnomeKeyring = true;
  
  programs.evolution={
		enable = true;
  };
  services.gnome.evolution-data-server.enable = true;
  environment.systemPackages = with pkgs; [
	xclip
	
	starship

	alsa-utils
    
	libreoffice

	tree
                #neovim
    parsec-bin
    #clases 
    anydesk   
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
    python312
    
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
];
  services.emacs.enable = true;

  nixpkgs.config.permittedInsecurePackages = [
          "electron-27.3.11"
  ];

  #fucking firefox
  programs.firefox.enable = true;
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

 services.xserver.desktopManager.xfce.enable = true;
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  
  #nerdfonts para las apps
  #fonts.packages = with pkgs; [ nerdfonts ];
  fonts.packages = [] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
}
