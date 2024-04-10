{ pkgs, inputs, lib, ... }: {
  wayland.windowManager.hyprland = {
    settings = {
      bind = [ "$mainMod SHIFT, C, exec, hyprpicker -an" ];
    };
  };

  home.packages = with pkgs; [
    hyprpicker
  ];
}
