{ config, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {

      monitor = ",preferred,auto,auto";

      "$terminal" = "alacritty";
      "$menu" = "rofi -show drun -show-icons";

      exec-once = [
        "waybar"
        "dunst"
        "nm-applet --indicator"
        "$terminal"
      ];

      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];

      general = {
        gaps_in = "5";
        gaps_out = "10";
        border_size = "2";
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";

        resize_on_border = "false";
        
        # May want this in future for games
        # allow_tearing = "true";

        layout = "dwindle";
      };

      decoration = {
        rounding = "10";
        rounding_power = "2";
        active_opacity = "1.0";
        inactive_opacity = "0.7";

        shadow = {
          enabled = "true";
          range = "4";
          render_power = "3";
          color = "rgba(1a1a1aee)";
        };

        blur = {
          enabled = "true";
          size = "3";
          passes = "1";
          vibrancy = "0.1696";
        };
      };

      animations = {
        enabled = "yes, please :)";

        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];

        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };

      dwindle = {
        pseudotile = "true";
        preserve_split = "true";
      };

      master = {
        new_status = "master";
      };

      misc = {
        force_default_wallpaper = "0";
        disable_hyprland_logo = "true";
      };

      input = {
        kb_layout = "gb";
        
        follow_mouse = "1";

        sensitivity = "0";
      };

      "$mod" = "SUPER";

      bind = [
        # i3-like binds
        "$mod, Return, exec, $terminal"
        "$mod, d, exec, $menu"
        "$mod SHIFT, q, killactive"

        # Hyprland binds
        "$mod, m, exit"
        "$mod, p, pseudo"
        "$mod, s, togglesplit"

        # Move focus
        "$mod, h, movefocus, l"
        "$mod, l, movefocus, r"
        "$mod, j, movefocus, d"
        "$mod, k, movefocus, u"
        
        # Switch workspaces
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        # Move active window to workspace
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"
      ];
    };
  };  
}
