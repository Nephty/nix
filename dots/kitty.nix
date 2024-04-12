{ config, inputs, lib, specialArgs, options, modulesPath, nixosConfig, osConfig }: {
 wayland.windowManager.hyprland = {
    settings = {
      bind = [ "$mainMod, Return, exec, kitty" ];
    };
  };

  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
    };
    settings = {
#      foreground = "#DADBEA";
      foreground = "#${config.colorScheme.palette.base06}";
#      background = "#22242D";
      background = "#${config.colorScheme.palette.base00}";
      background_opacity = "0.3";
      cursor = "#${config.colorScheme.palette.base04}";
      # I think I don't need this since I use beam cursor shape
      cursor_text_color = "#4C0100";
      cursor_shape = "beam";
      cursor_beam_thickness = "2.75";
      cursor_blink_interval = "0.35";
      cursor_stop_blinking_after = "5.0";
      confirm_os_window_close = 0;
      copy_on_select = "no";
      editor = "pluma";
      resize_draw_strategy = "scale";
    };
  };
}
