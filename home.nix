{config, pkgs, ...}: {
  home-manager.users.dylan = {
    home.stateVersion = "24.11";
    home.file."/.config/wayfire.ini".source = ./wayfire.ini;
    home.packages = with pkgs; [
      yofi
      kitty
    ]; 
  };
  
}
