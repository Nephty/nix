{
  home.file = {
    "/home/nephty/.config/neofetch/config.conf" = {
      text = ''
        print_info() {
          info title
          info underline

          info "OS" distro
          info "Host" model
          info "Kernel" kernel
          info "Uptime" uptime
          info "Packages" packages
          info "Shell" shell
          info "Resolution" resolution
          info "DE" de
          info "WM" wm
          info "WM Theme" wm_theme
          info "Terminal" term
          info "Terminal Font" term_font
          info "CPU" cpu
          info "GPU" gpu
          info "Memory" memory

          info cols
        }
      '';
    };
  };
}
