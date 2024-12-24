{config, pkgs, ...}: {
   environment.persistence."/persist".users.dylan = {
      directories = [
        "Downloads"
        "Music"
        "Pictures"
        "Documents"
        "Videos"
        ".local/share/steam"
        ".config/discord"
	".config/chromium" 
	".steam"
        ".local/state/wireplumber/"
      ];
      files = [
      ];
    };

  home-manager.users.dylan = {
    home.stateVersion = "24.11";
    home.packages = with pkgs; [
      papirus-icon-theme
      ungoogled-chromium
      yofi
      feh
      pavucontrol
      grim
      discord
      qtractor
    ]; 
  };
   
  services.greetd.enable = true;
  services.greetd.settings = {
    package = pkgs.greetd.greetd;
    default_session = {
      command = "${pkgs.greetd.greetd}/bin/agreety --cmd wayfire";
    };
  };
  
  home-manager.users.dylan.programs.kitty = {
    enable = true;
    themeFile = "Solarized_Dark";
    font = {
      package = pkgs.iosevka;
      name = "Iosevka";
      size = 12;
    };
  };
 
  home-manager.users.dylan.programs.wpaperd = {
    enable = true;
    settings = {
        default = {
          path = "/home/dylan/Pictures/wall.png";
        };
    };
  };
  home-manager.users.dylan.home.file."/Pictures/wall.png".source=../Pictures/wall.png;
 
 
  programs.wayfire.enable = true;
  programs.wayfire.plugins = with pkgs.wayfirePlugins; [wayfire-shadows];
  home-manager.users.dylan.home.file."/.config/wayfire.ini".source = ./wayfire.ini;
  home-manager.users.dylan.home.file."/.config/yofi/yofi.config".source = ./yofi.config;

  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };
 
  programs.chromium.enable = true;
  programs.steam.enable = true;
}
