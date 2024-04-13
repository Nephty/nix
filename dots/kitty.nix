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
    settings = with config.colorScheme.palette; {
#      foreground = "#DADBEA";
#      background = "#22242D";
      background_opacity = "0.3";
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


      foreground = "#${base07}";
      background = "#${base00}";
      color0     = "#${base00}";
      color1     = "#${base0F}";
      color2     = "#${base0B}";
      color3     = "#${base0A}";
      color4     = "#${base0D}";
      color5     = "#${base0E}";
      color6     = "#${base0C}";
      color7     = "#${base07}";
      color8     = "#${base05}";
      color9     = "#${base08}";
      color10    = "#${base0B}";
      color11    = "#${base0A}";
      color12    = "#${base0D}";
      color13    = "#${base0E}";
      color14    = "#${base0C}";
      color15    = "#${base07}";
    };
  };
}
