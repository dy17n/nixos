{config, pkgs, ...}: {
  home-manager.users.dylan = {
    home.stateVersion = "24.11";
    home.packages = with pkgs; [
      yofi
      kitty
    ]; 
  };

  services.greetd.enable = true;
  programs.wayfire.enable = true;
  programs.wayfire.plugins = [];
  home-manager.users.dylan.home.file."/.config/wayfire.ini".source = ./wayfire.ini;

  programs.firefox.enable = true;
}
