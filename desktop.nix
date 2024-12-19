{config, pkgs, ...}: {
  home-manager.users.dylan = {
    home.stateVersion = "24.11";
    home.packages = with pkgs; [
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
  home-manager.users.dylan.home.file."/Pictures/wall.png".source=./Pictures/wall.png;
 
 
  programs.wayfire.enable = true;
  programs.wayfire.plugins = with pkgs.wayfirePlugins; [wayfire-shadows];
  home-manager.users.dylan.home.file."/.config/wayfire.ini".source = ./wayfire.ini;
  home-manager.users.dylan.home.file." /.config/yofi/yofi.config".source = ./yofi.config;
  services.pipewire = {
    enable = true;
    jack.enable = true;
  };
 
  programs.firefox.enable = true;
  programs.steam.enable = true;
}
