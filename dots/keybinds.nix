{
  wayland.windowManager.hyprland = {
    settings = {
      bind = [
        "$mainMod, C, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, nautilus"
        "$mainMod, R, exec, nautilus /home/nephty/Documents/UMons/MAB1\ 2023-2024/"
        "$mainMod, Space, togglefloating,"
        "$mainMod SHIFT, N, exec, shutdown now"
        "$mainMod, T, exec, ~/bin/brightup.sh"
        "$mainMod, G, exec, ~/bin/brightdown.sh"
        "$mainMod SHIFT, I, exec, idea-ultimate"
        "$mainMod SHIFT, P, exec, pycharm"
        "$mainMod SHIFT, D, exec, discord"
        "$mainMod SHIFT, S, exec, grim screenshot.png"
        "$mainMod, X, exec, apostrophe"
        "$mainMod, A, exec, pluma --new-window"
        "$mainMod, O, exec, ./bin/themepicker.sh purple_light"
        "$mainMod, L, exec, ./bin/themepicker.sh purple_dark"
        "$mainMod, N, exec, ./bin/themepicker.sh dracula"
        "$mainMod, F, exec, ./bin/focusSwitch.sh"
        "$mainMod SHIFT, X, exec, ~/Softwares/Logseq/Logseq-linux-x64-0.9.18.AppImage"
        "$mainMod SHIFT, V, exec, code"

        "$mainMod, P, pseudo,"
        "$mainMod, J, togglesplit,"
        "$mainMod, U, exec, ~/bin/click2.sh brave 1 1"
        "$mainMod SHIFT, U, exec, killall click2.sh xdotool"

        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        "$mainMod, 10, workspace, 1" # 10 is keycode number for key 1&|
        "$mainMod, 11, workspace, 2" # 11 is keycode number for key 2é@
        "$mainMod, 12, workspace, 3" # 12 is keycode number for key 3"#
        "$mainMod, 13, workspace, 4" # 13 is keycode number for key 4'
        "$mainMod, 14, workspace, 5" # 14 is keycode number for key 5(
        "$mainMod, 15, workspace, 6" # 15 is keycode number for key 6§^
        "$mainMod, 16, workspace, 7" # 16 is keycode number for key 7è
        "$mainMod, 17, workspace, 8" # 17 is keycode number for key 8!
        "$mainMod, 18, workspace, 9" # 18 is keycode number for key 9ç{
        "$mainMod, 19, workspace, 10" # 19 is keycode number for key 0à}

        "$mainMod SHIFT, 10, movetoworkspace, 1"
        "$mainMod SHIFT, 11, movetoworkspace, 2"
        "$mainMod SHIFT, 12, movetoworkspace, 3"
        "$mainMod SHIFT, 13, movetoworkspace, 4"
        "$mainMod SHIFT, 14, movetoworkspace, 5"
        "$mainMod SHIFT, 15, movetoworkspace, 6"
        "$mainMod SHIFT, 16, movetoworkspace, 7"
        "$mainMod SHIFT, 17, movetoworkspace, 8"
        "$mainMod SHIFT, 18, movetoworkspace, 9"
        "$mainMod SHIFT, 19, movetoworkspace, 10"

        "$mainMod, TAB, hyprexpo:expo, toggle"
      ];

      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
