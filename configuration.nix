{ config, pkgs, lib, ... }:

let
#	nixos-projects = fetchGit {
#    		url = "https://github.com/Harjanator/nixos-projects.git";
#    		ref = "main";
#    		rev = "23c9dcd9ffbbc805f336ae8bbdcaa94f4a1f5a00";
#  	};
  	nixos-zsh = fetchGit {
    		url = "https://github.com/Harjanator/nixos-zsh.git";
    		ref = "main";
#    		rev = "0077cdcbe19b84c3dcacd45a14532f5db450e8ee";
  	};
  	nixos-bash = fetchGit {
    		url = "https://github.com/Harjanator/nixos-bash.git";
    		ref = "main";
#    		rev = "9f0bd593f9420b34881cf1fac6ca4d3630421795";
  	};
  	nixos-ssh = fetchGit {
    		url = "https://github.com/Harjanator/nixos-ssh.git";
    		ref = "main";
#    		rev = "0a033a979217d7e07933db23105035b6bca90859";
  	};
#  	nixos-git = fetchGit {
#    		url = "https://github.com/Harjanator/nixos-git.git";
#    		ref = "main";
#    		rev = "3331972f03dbc4571ff8ebcfbd10e5862bf553d2";
#  	};
  	nixos-fonts = fetchGit {
    		url = "https://github.com/Harjanator/nixos-fonts.git";
    		ref = "main";
#    		rev = "8846a7acbcac0e455e0980e57681b56c2f3a0b93";
  	};
#  	nixos-nvim = fetchGit {
#    		url = "https://github.com/Harjanator/nixos-nvim.git";
#    		ref = "main";
#    		rev = "92bca79a0f3402c9e52a21ad418b2f81e053fd7a";
#  	};
  	nixos-lazygit = fetchGit {
    		url = "https://github.com/Harjanator/nixos-lazygit.git";
    		ref = "main";
#    		rev = "84d5cba0a647c4bd2816620cd248f7a901c6116d";
  	};
#  	nixos-gh = fetchGit {
#    		url = "https://github.com/Harjanator/nixos-gh.git";
#    		ref = "main";
#    		rev = "b606bc30b4730fa423bf36ea9b7c43312a720a8a";
#  	};
  	nixos-htop = fetchGit {
    		url = "https://github.com/Harjanator/nixos-htop.git";
    		ref = "main";
#    		rev = "05c6c80f67769c035ea60da1a1a4171f2c18f854";
  	};
#  	nixos-btop = fetchGit {
#    		url = "https://github.com/Harjanator/nixos-btop.git";
#    		ref = "main";
#    		rev = "b1791e8752989ef3ad9801eac469e6700512c733";
#  	};
  	nixos-yazi = fetchGit {
    		url = "https://github.com/Harjanator/nixos-yazi.git";
    		ref = "main";
#    		rev = "4baba9b239c0edd8642a977cf6c0a66a5246e1b1";
  	};
  	nixos-fastfetch = fetchGit {
    		url = "https://github.com/Harjanator/nixos-fastfetch.git";
    		ref = "main";
#    		rev = "230cc3dd29b0860691438db3b39e140c8dddaa0f";
  	};
  	nixos-locale = fetchGit {
    		url = "https://github.com/Harjanator/nixos-locale.git";
    		ref = "main";
#    		rev = "b573cf05c00af41ae86240e1e489765eec1136ca";
  	};
  	nixos-bat = fetchGit {
    		url = "https://github.com/Harjanator/nixos-bat.git";
    		ref = "main";
#    		rev = "ca2a5ff6c6fa6d1952ab498943545f362e907859";
  	};
in {
  	imports = [
			/etc/nixos/hardware-configuration.nix
			/etc/nixos/variables.nix
			<home-manager/nixos>
    		(import "${nixos-locale}/configuration.nix")
    		(import "${nixos-zsh}/configuration.nix")
    		(import "${nixos-ssh}/configuration.nix")
			(import "${nixos-fonts}/configuration.nix")
    		(import "${nixos-fastfetch}/configuration.nix")
    		(import "${nixos-htop}/configuration.nix")
#    		(import "${nixos-btop}/configuration.nix")
    		(import "${nixos-bash}/configuration.nix")
#    		(import "${nixos-git}/configuration.nix")
#    		(import "${nixos-projects}/configuration.nix")
    		(import "${nixos-bat}/configuration.nix")
#    		(import "${nixos-yazi}/configuration.nix")
#    		(import "${nixos-lazygit}/configuration.nix")
#    		(import "${nixos-nvim}/configuration.nix")
#    		(import "${nixos-gh}/configuration.nix")
  	];

	system = { stateVersion = "26.05"; };

 	boot.loader = {
    		systemd-boot.enable = true;
    		efi.canTouchEfiVariables = true;
  	};

	networking = {
#		hostName = "typonixos";
		networkmanager.enable = true;
#		hosts."127.0.0.1" = [ "passbolt.local" ];
	};

	nix.settings.experimental-features = [ "nix-command" "flakes" ];
	nix.gc = {
		automatic = true;  # Enable the automatic garbage collector
		dates = "03:15";   # When to run the garbage collector
		options = "-d";    # Arguments to pass to nix-collect-garbage
	};
	nixpkgs.config.allowUnfree = true;

#	hardware = {
#		graphics.enable = true;
#		nvidia = {
#			modesetting.enable = true;
#			open = false;
#			nvidiaSettings = true;
#		};
#	};

	users = {
		users.${config.username} = {
			isNormalUser = true;
    			extraGroups = [
				"networkmanager"
				"wheel"
#				"audio"
#				"docker"
			];
			openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHta20AMtJvLmxCglxEQrnutFacEGTJ+/80ODeS2lbT7 gurulandia"];
		};
  		groups.mlocate = {};
  	};
	users.users.root.openssh.authorizedKeys.keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHta20AMtJvLmxCglxEQrnutFacEGTJ+/80ODeS2lbT7 gurulandia"];

	security.sudo = {
		# place top level options (like wheelNeedPassword) here
		enable = true; # make sure to enable the sudo package
		execWheelOnly = false;
		wheelNeedsPassword = false;

		extraConfig = "#includedir /etc/sudoers.d"; # write custom config in here

		extraRules = [
			# place sudoers rules here
		];
	};

	environment.wordlist.enable = true;
  	environment.systemPackages = with pkgs; [
			
			git
      		wget
			curl
			jq
      		tmux
      		unzip
      		ripgrep
			net-tools
			dig
			mc
			dnslookup
			traceroute
			inetutils
			fzf
      		tree			
     		fd
#			bat
			zip
      		ascii-image-converter
      		mlocate
			stow
			lsb-release
#			subversion
#			scowl

	# git git-lfs
    # nixos-anywhere htop btop

#      		man-db
#      		gcc
#      		fuse
#      		inxi
#      		docker_29
#      		docker-compose
#      		gdu
#      		rnote
#      		xclip
#      		copyq
#      		gnome-disk-utility
#      		lolcat
#      		pciutils
#			live-server
#			nodejs_24
#			pnpm
#			tealdeer
#			gnumake
#			gitleaks
#			trivy
#			dive
#			calc
#			zellij
#			wdiff
#			insomnia
#			zed-editor
#			code-cursor
#			davinci-resolve
#			ffmpeg
#			claude-code
#			asciinema
#			railway
#			stripe-cli
#			claude-monitor
#			visidata
	];

	programs = {
		nix-ld.enable = true; 
	};
	
 	services = {
		qemuGuest.enable = true;
#		printing.enable = true;
#		xserver.videoDrivers = [ "nvidia" ];
	};

#	virtualisation.docker = {
#		package = pkgs.docker_29;
#		enable = true;
#	};

	zramSwap.enable = true;
	systemd.oomd.enable = true;
}
