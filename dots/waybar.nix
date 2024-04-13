{ config, inputs, ... }: {
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        height = 31;
        space = 0;
        margin-top = 10;
        margin-left = 10;
        margin-right = 10;

        modules-left = [
          "custom/spacerleft"
          "hyprland/workspaces"
          "custom/spacerright"
        ];

        modules-center = [
          "custom/spacerleft"
          "clock"
          "custom/spacerright"
        ];

        modules-right = [
          "custom/spacerleft"
          "custom/ping"
          "custom/spacercenter"
          "pulseaudio"
          "custom/spacercenter"
          "custom/cpu"
          "custom/spacercenter"
          "memory"
          "custom/spacercenter"
          "battery"
          "custom/spacerright"
        ];

        # There are 3 different spacers because their CSS differs
        "custom/spacerleft" = {
          format = "  ";
        };

        "custom/spacerright" = {
          format = "  ";
        };

        "custom/spacercenter" = {
          format = "  ";
        };

        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          on-click = "activate";
          format = "{name}";
          sort-by-number = false;
        };

        "battery" = {
          format-charging = "{capacity}%"; # icon : 
          format = "{capacity}%"; # icon : 
        };

        "clock" = {
          tooltip-format = "{:%Y %B}\n<tt>{calendar}</tt>";
          format = "{:%d-%m-%y  %H:%M}";
        };

        "cpu" = {
          format = "{usage:02}%"; # icon : 
          tooltip = true;
          interval = 1;
        };

        "memory" = {
          format = "{used:0.2f} Go"; # icon : 
        };

        "pulseaudio" = {
          format = "{volume}%"; # can use {icon}
          format-bluetooth = "{volume}% {icon}";
          format-bluetooth-muted = "{icon}";
          format-muted = "x";
          format-source = " {volume}%";
          format-source-muted = "";
          format-icons = {
              headphone = " ";
              hands-free = "";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              default = ["" "" ""];
          };
          on-click = "pavucontrol";
        };

	    "custom/ping" = {
          format = "{}";l = 1;
          return-type = "string";
          exec = "/home/nephty/bin/pong.sh";
          interval = 2;
        };

        "custom/cpu" = {
          format = "{}";
          return-type = "string";
          exec = "/home/nephty/bin/cpu.sh";
          interval = 2;
        };
      };
    };

    style = ''
      * {
        /* `otf-font-awesome` is required to be installed for icons */
        font-family: JetBrainsMono Nerd Font;
        font-size: 15px;
      }
      /* Roboto, Helvetica, Arial, sans-serif */

      window#waybar {
          background-color: rgba(43, 48, 59, 0.0);
          /* border-bottom: 3px solid rgba(100, 114, 125, 0.5); */
          color: #${config.colorScheme.palette.base07};
          transition-property: background-color;
          transition-duration: .5s;
      }

      window#waybar.hidden {
          opacity: 0.2;
      }

      /*
      window#waybar.empty {
          background-color: transparent;
      }
      window#waybar.solo {
          background-color: #FFFFFF;
      }

      window#waybar.termite {
          background-color: #3F3F3F;
      }

      window#waybar.chromium {
          background-color: #000000;
          border: none;
      }
      */

      button {
          /* Use box-shadow instead of border so the text isn't offset */
          box-shadow: inset 0 -3px transparent;
          /* Avoid rounded borders under each button name */
          border: none;
          border-radius: 0;
      }

      /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
      button:hover {
          background: inherit;
          box-shadow: inset 0 -3px #${config.colorScheme.palette.base07};
      }

      #workspaces button {
          padding: 0 5px;
          background-color: transparent;
          color: #${config.colorScheme.palette.base07};
      }

      #workspaces button:hover {
          background: rgba(0, 0, 0, 0.2);
      }

      #workspaces button.active {
          background: linear-gradient(to right, #${config.colorScheme.palette.base04} 0%, #${config.colorScheme.palette.base00} 30%);
      }

      #workspaces button.urgent {
          background-color: #${config.colorScheme.palette.base07};
      }

      #mode {
          background-color: #64727D;
          border-bottom: 3px solid #ffffff;
      }

      #clock {
          background-color: #${config.colorScheme.palette.base00};
          color: #${config.colorScheme.palette.base07};
          border-top-style: double;
          border-bottom-style: double;
          border-width: 3px;
      }

      #memory,
      #disk,
      #temperature,
      #backlight,
      #network,
      #pulseaudio,
      #wireplumber,
      #custom-media,
      #tray,
      #mode,
      #idle_inhibitor,
      #scratchpad,
      #mpd {
          padding: 0 10px;
          color: #ffffff;
      }

      #window,
      #workspaces {
          background-color: #${config.colorScheme.palette.base00};
          color: #${config.colorScheme.palette.base07};
          margin: 0 4px;
          border-top-style: double;
          border-bottom-style: double;
          border-width: 3px;
      }

      /* If workspaces is the leftmost module, omit left margin
      .modules-left > widget:first-child > */ #workspaces {
          margin-left: 0;
      }

      /* If workspaces is the rightmost module, omit right margin
      .modules-right > widget:last-child > */ #workspaces {
          margin-right: 0;
      }

      #custom-spacerleft {
          background-color: #${config.colorScheme.palette.base00};
          border-radius: 10px 0px 0px 10px;
          border-top-style: double;
          border-left-style: double;
          border-bottom-style: double;
          border-width: 3px;
          border-color: #${config.colorScheme.palette.base07};
      }

      #custom-spacercenter {
          background-color: #${config.colorScheme.palette.base00};
          border-top-style: double;
          border-bottom-style: double;
          border-width: 3px;
          border-color: #${config.colorScheme.palette.base07};
      }

      #custom-spacerright {
          background-color: #${config.colorScheme.palette.base00};
          border-radius: 0px 10px 10px 0px;
          border-top-style: double;
          border-right-style: double;
          border-bottom-style: double;
          border-width: 3px;
          border-color: #${config.colorScheme.palette.base07};
      }

      #custom-ping {
          background-color: #${config.colorScheme.palette.base00};
          color: #${config.colorScheme.palette.base07};
          border-top-style: double;
          border-bottom-style: double;
          border-width: 3px;
          border-color: #${config.colorScheme.palette.base07};
      }

      #custom-cpu {
          background-color: #${config.colorScheme.palette.base00};
          color: #${config.colorScheme.palette.base07};
          border-top-style: double;
          border-bottom-style: double;
          border-width: 3px;
          border-color: #${config.colorScheme.palette.base07};
      }

      #battery {
          background-color: #${config.colorScheme.palette.base00};
          color: #${config.colorScheme.palette.base07};
          border-top-style: double;
          border-bottom-style: double;
          border-width: 3px;
      }

      #battery.charging, #battery.plugged {
          color: #ffffff;
          background-color: #${config.colorScheme.palette.base00};
          color: #${config.colorScheme.palette.base07};
          border-top-style: double;
          border-bottom-style: double;
          border-width: 3px;
      }

      @keyframes blink {
          to {
              background-color: #${config.colorScheme.palette.base07};
              color: #${config.colorScheme.palette.base00};
          }
      }

      #battery.critical:not(.charging) {
          background-color: #${config.colorScheme.palette.base00};
          color: #${config.colorScheme.palette.base07};
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
          border-top-style: double;
          border-bottom-style: double;
          border-width: 3px;
      }

      label:focus {
          background-color: #${config.colorScheme.palette.base00};
      }

      #cpu {
          background-color: #${config.colorScheme.palette.base00};
          color: #${config.colorScheme.palette.base07};
          border-top-style: double;
          border-bottom-style: double;
          border-width: 3px;
      }

      #memory {
          background-color: #${config.colorScheme.palette.base00};
          color: #${config.colorScheme.palette.base07};
          border-top-style: double;
          border-bottom-style: double;
          border-width: 3px;
      }

      #disk {
          background-color: #964B00;
      }

      #backlight {
          background-color: #90b1b1;
      }

      #network {
          background-color: #2980b9;
      }

      #network.disconnected {
          background-color: #f53c3c;
      }

      #pulseaudio {
          background-color: #${config.colorScheme.palette.base00};
          color: #${config.colorScheme.palette.base07};
          border-top-style: double;
          border-bottom-style: double;
          border-width: 3px;
      }

      #pulseaudio.muted {
          background-color: #${config.colorScheme.palette.base00};
          color: #${config.colorScheme.palette.base07};
          border-top-style: double;
          border-bottom-style: double;
          border-width: 3px;
      }

      #wireplumber {
          background-color: #fff0f5;
          color: #000000;
      }

      #wireplumber.muted {
          background-color: #f53c3c;
      }

      #custom-media {
          background-color: #66cc99;
          color: #2a5c45;
          min-width: 100px;
      }

      #custom-media.custom-spotify {
          background-color: #66cc99;
      }

      #custom-media.custom-vlc {
          background-color: #ffa000;
      }

      #temperature {
          background-color: #f0932b;
      }

      #temperature.critical {
          background-color: #eb4d4b;
      }

      #tray {
          background-color: #2980b9;
      }

      #tray > .passive {
          -gtk-icon-effect: dim;
      }

      #tray > .needs-attention {
          -gtk-icon-effect: highlight;
          background-color: #eb4d4b;
      }

      #idle_inhibitor {
          background-color: #2d3436;
      }

      #idle_inhibitor.activated {
          background-color: #ecf0f1;
          color: #2d3436;
      }

      #mpd {
          background-color: #66cc99;
          color: #2a5c45;
      }

      #mpd.disconnected {
          background-color: #f53c3c;
      }

      #mpd.stopped {
          background-color: #90b1b1;
      }

      #mpd.paused {
          background-color: #51a37a;
      }

      #language {
          background: #00b093;
          color: #740864;
          padding: 0 5px;
          margin: 0 5px;
          min-width: 16px;
      }

      #keyboard-state {
          background: #97e1ad;
          color: #000000;
          padding: 0 0px;
          margin: 0 5px;
          min-width: 16px;
      }

      #keyboard-state > label {
          padding: 0 5px;
      }

      #keyboard-state > label.locked {
          background: rgba(0, 0, 0, 0.2);
      }

      #scratchpad {
          background: rgba(0, 0, 0, 0.2);
      }

      #scratchpad.empty {
      	background-color: transparent;
      }
    '';
  };
}
