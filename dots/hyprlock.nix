{ config, inputs, pkgs, lib, specialArgs, options, modulesPath, nixosConfig, osConfig }: {
  imports = [
    inputs.hyprlock.homeManagerModules.hyprlock
  ];

  wayland.windowManager.hyprland = {
    settings = {
      bind = [ "$mainMod SHIFT, E, exec, hyprlock" ];
    };
  };

  programs.hyprlock = {
    enable = true;

    general = {
      disable_loading_bar = true;
      grace = 5;
    };

    backgrounds = [
      {
        monitor = "";
        path = "screenshot";
        blur_passes = 3;
        vibrancy = 0.3;
      }
    ];

    input-fields = [
      {
        size = {
          width = 400;
          height = 60;
        };

        outline_thickness = 2;

        dots_size = 0.2;
        dots_spacing = 0.2;
        dots_center = true;

        outer_color = "rgb(#${config.colorScheme.palette.base00})";
        inner_color = "rgb(#${config.colorScheme.palette.base00})";
        font_color = "rgb(#${config.colorScheme.palette.base06})";

        placeholder_text = "";

        check_color = "rgb(#${config.colorScheme.palette.base09})";
        fail_color = "rgb(#${config.colorScheme.palette.base07})";
      }
    ];

    labels = [
      {
        monitor = "";
        text =
        ''
          cmd[update:1000] echo "<span>$(${lib.getExe' pkgs.coreutils-full "date"} '+%H:%M %p')</span>"
        '';
        font_family = "JetBrainsMono Nerd Font";
        font_size = 120;
        color = "rgb(#${config.colorScheme.palette.base06})";

        position = {
          x = 50;
          y = -240;
        };

        valign = "top";
        halign = "center";
      }
    ];

  };
}
