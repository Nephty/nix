{ inputs, pkgs, ... }: {
  imports = [
    inputs.hyprland.homeManagerModules.default
  ];

  wayland.windowManager.hyprland = {
    settings = {
      plugins = [
        inputs.hyprland-plugins.packages.${pkgs.system}.hyprexpo
      ];

      plugin = {
        hyprexpo = {
          columns = 3;
          gap_size = 5;
          bg_col = "rgb(#${config.colorScheme.palette.base00})";
          workspace_method = "first 1";
        };
      };

      bind = [
        "$mainMod, TAB, hyprexpo:expo, toggle"
      ];
    };
  };
}
