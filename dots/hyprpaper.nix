{ config, inputs, pkgs, lib, specialArgs, options, modulesPath, nixosConfig, osConfig }: {
  imports = [
    inputs.hyprpaper.homeManagerModules.hyprpaper
  ];

  services.hyprpaper = {
    enable = true;
    wallpapers = [
      "eDP-1,~/nix/background.jpg"
      "HDMI-A-2,~/nix/background.jpg"
    ];
    preloads = [
      "~/nix/background.jpg"
    ];
  };
}
