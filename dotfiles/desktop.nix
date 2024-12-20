{config, pkgs, ...}: {
   environment.persistence."/persist".users.dylan = {
      directories = [
        "Downloads"
        "Music"
        "Pictures"
        "Documents"
        "Videos"
        ".local/share/direnv"
        ".config/discord"
	".config/chromium" 
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
    package = pkgs.greetd.wlgreet;
    default_session = {
      command = "${pkgs.greetd.wlgreet}/bin/wlgreet --command wayfire";
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

  services.pipewire = {
    enable = true;
    jack.enable = true;
  };
 
  programs.chromium.enable = true;
  programs.steam.enable = true;
}
