{inputs, config, lib, pkgs, ...}:

{
  imports = [ inputs.hypridle.homeManagerModules.default ];
  services.hypridle = {
    enable = true;

    listeners = [
      {
        timeout = 180;
        onTimeout = "${lib.getExe pkgs.hyprlock}";
      }
      {
        timeout = 240;
        onTimeout = "${lib.getExe' pkgs.hyprland "hyprctl"} dispatch dpms off";
        onResume = "${lib.getExe' pkgs.hyprland "hyprctl"} dispatch dpms on";
      }
    ];
  };
}
