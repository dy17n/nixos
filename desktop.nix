{config, pkgs, ...}: {
  home-manager.users.dylan = {
    home.stateVersion = "24.11";
    home.packages = with pkgs; [
      yofi
      feh
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
  programs.wayfire.plugins = [];
  home-manager.users.dylan.home.file."/.config/wayfire.ini".source = ./wayfire.ini;
  
  programs.firefox.enable = true;
}
