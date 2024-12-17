{config, pkgs, ...}: {
  home-manager.users.dylan = {
    home.stateVersion = "24.11";
    home.packages = with pkgs; [
      yofi
      kitty
    ]; 

    services.xserver.displayManager.gdm.enable = true;
    programs.wayland.enable = true;
    programs.wayland.plugins = [];
    home.file."/.config/wayfire.ini".source = ./wayfire.ini;

    programs.firefox.enable = true;
  };
  
}
