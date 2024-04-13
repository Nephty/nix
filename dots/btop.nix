{ config, ... }: {
  programs.btop = {
    enable = true;
    settings = {
      graph_symbol = "braille";
      update_ms = 1300;
      theme_background = false;
      color_theme = "TTY";
      proc_gradient = false;
      proc_sorting = "cpu lazy";
      show_cpu_freq = true;
      show_battery = true;
    };
  };
}
