{ config, inputs, pkgs, lib, specialArgs, options, modulesPath, nixosConfig, osConfig }: {
  imports = [
    inputs.hyprpaper.homeManagerModules.hyprpaper
  ];

  services.hyprpaper = {
    enable = true;
    wallpapers = [
      "eDP-1,~/Nix/background.jpg"
    ];
    preloads = [
      "~/Nix/background.jpg"
    ];
  };
}
