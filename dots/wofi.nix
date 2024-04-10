{
  wayland.windowManager.hyprland = {
    settings = {
      bind = [ "$mainMod, D, exec, wofi" ];
    };
  };

  programs.wofi = {
    enable = true;

    settings = {
      width = 500;
      height = 500;
      location = "center";
      show = "drun";
      prompt = "";
      filter_rate = 100;
      allow_markup = true;
      no_actions = true;
      halign = "fill";
      orientation = "vertical";
      content_halign = "fill";
      insensitive = true;
      allow_images = true;
      image_size = 40;
      sort_order = "alphabetical";
    };

    style = ''
      * {
        font-family:  JetBrains Mono Nerd Font;
        font-size: 16px;
        font-weight: 400;
        outline-style: none;
      }

      #window {
        margin: 0px;
        border: 2px solid;
        border-color: #22242D;
        border-radius: 12px;
        background-color: #22242D;
      }

      #input {
        margin: 16px;
        background-color: #22242D;
        color: #7F7F7F;
        border-radius: 25px;
        border: transparent;
      }

      #scroll {
        margin-bottom: 2px;
        margin-right: 2px;
      }

      #entry {
        margin: 0px 4px;
      }

      #entry:selected {
        background-color: #7F7F7F;
        border-radius: 8px;
      }

      #entry > box {
        margin-left: 0px;
        color: #dedede;
      }

      #entry image {
        padding-right: 10px;
        background-color: transparent;
      }

      #text {
        background-color:transparent;
      }
    '';
  };
}
