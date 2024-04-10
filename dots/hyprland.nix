{ config, inputs, pkgs, lib, specialArgs, options, modulesPath, nixosConfig, osConfig }: {

  imports = [
    inputs.hyprland.homeManagerModules.default
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    package = inputs.hyprland.packages.${pkgs.system}.hyprland;

    plugins = [
      inputs.hyprland-plugins.packages.${pkgs.system}.hyprexpo
    ];

    settings = {
      monitor="eDP-1, 1920x1080, 0x0, 1";

      exec-once = [
        "swaybg -i ~/Nix/background.jpg"
        "dunst"
        "waybar"
        "swayidle -w timeout 180 'bin/lock_with_grace.sh' before-sleep 'swaylock -f'"
        "xset -b"
      ];

      env = [
        "XCURSOR_SIZE,24"
        "WLR_NO_HARDWARE_CURSORS,1"
      ];

      input = {
        kb_layout = "be";

        follow_mouse = 1;

        touchpad = {
            natural_scroll = false;
            disable_while_typing = false;
            drag_lock = false;
        };

        sensitivity = 0; # -1.0 - 1.0, 0 means no modification. There can be per device configuration
      };

      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        "col.active_border" = "rgba(FFFFFFFF) rgba(453745FF) 45deg";
        "col.inactive_border" = "rgba(00000000)";

        layout = "dwindle";
      };

      decoration = {
        rounding = 10;

        blur = {
          enabled = true;
          size = 2;
          passes = 4;
          new_optimizations = true;
      	  contrast = 1;
      	  brightness = 1;
      	  noise = 0;
        };

        drop_shadow = true;
        shadow_range = 20;
        shadow_render_power = 3;

        "col.shadow" = "rgba(ffffff55)";
        "col.shadow_inactive" = "rgba(00000044)";
      };

      animations = {
        enabled = true;

        bezier = [
          "myBezier, 0.3, 0.9, 0.1, 1"
          "myExpo, 0.2, 0.3, 0, 0.9"
          "slowFastSlow, 0.4, 0, 0, 1"
          "slowing, 0, 0.9, 0.4, 0.8"
          "accelerating, 0.5, 0.1, 1, 0.1"
          "md3_decel, 0.05, 0.7, 0.1, 1"
        ];

        animation = [
          "windows, 1, 6, md3_decel, slide"
#          "windowsOut, 1, 4.5, md3_decel, slide"
          "border, 1, 50, default"
#          "fade, 1, 7, default"
          "workspaces, 1, 6, slowFastSlow"
        ];
      };

      dwindle = {
        pseudotile = true; # master switch for pseudotiling
        preserve_split = true;
      };

      master = {
        new_is_master = true;
      };

      gestures = {
        workspace_swipe = false;
      };

      plugin = {
        hyprexpo = {
          columns = 3;
          gap_size = 5;
          bg_col = "rgba(44475ADD)";
          workspace_method = "first 1";
        };
      };

      "$mainMod" = "SUPER";
    };
  };
}
