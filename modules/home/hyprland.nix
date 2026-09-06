{ config, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";

    extraConfig = ''
      -- Variables (hyprlang's "$var" convention doesn't exist in Lua;
      -- these are just plain Lua locals now)
      local mod      = "SUPER"
      local terminal = "alacritty"
      local menu     = "rofi -show drun -show-icons"

      -----------------------
      ---- MONITORS -----
      -----------------------
      hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })

      -----------------------
      ---- AUTOSTART -----
      -----------------------
      hl.on("hyprland.start", function()
          hl.exec_cmd("waybar")
          hl.exec_cmd("dunst")
          hl.exec_cmd("nm-applet --indicator")
          hl.exec_cmd(terminal)
      end)

      -------------------------------
      ---- ENVIRONMENT VARIABLES ----
      -------------------------------
      hl.env("XCURSOR_SIZE", "24")
      hl.env("HYPRCURSOR_SIZE", "24")

      -----------------------------
      ---- LOOK AND FEEL ----
      -----------------------------
      hl.config({
          general = {
              gaps_in = 5,
              gaps_out = 10,
              border_size = 2,
              -- ["col.active_border"] = "rgba(33ccffee) rgba(00ff99ee) 45deg",
              -- ["col.inactive_border"] = "rgba(595959aa)",

              resize_on_border = false,

              -- May want this in future for games
              -- allow_tearing = true,

              layout = "dwindle",
          },

          decoration = {
              rounding = 10,
              rounding_power = 2,
              active_opacity = 1.0,
              inactive_opacity = 0.7,

              shadow = {
                  enabled = true,
                  range = 4,
                  render_power = 3,
                  -- color = "rgba(1a1a1aee)",
              },

              blur = {
                  enabled = true,
                  size = 3,
                  passes = 1,
                  vibrancy = 0.1696,
              },
          },

          -- was `enabled = "yes, please :)"` -- hyprlang's boolean parsing was
          -- forgiving about that; Lua wants a real boolean
          animations = {
              enabled = true,
          },

          dwindle = {
              preserve_split = true,
          },

          master = {
              new_status = "master",
          },

          misc = {
              force_default_wallpaper = 0,
              -- disable_hyprland_logo = true,
          },

          input = {
              kb_layout = "gb",
              follow_mouse = 1,
              sensitivity = 0,
          },
      })

      -- Bezier curves
      hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1} } })
      hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1} } })
      hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1} } })
      hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1.0} } })
      hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1} } })

      -- Animations
      hl.animation({ leaf = "global",        enabled = true, speed = 10,   bezier = "default" })
      hl.animation({ leaf = "border",        enabled = true, speed = 5.39, bezier = "easeOutQuint" })
      hl.animation({ leaf = "windows",       enabled = true, speed = 4.79, bezier = "easeOutQuint" })
      hl.animation({ leaf = "windowsIn",     enabled = true, speed = 4.1,  bezier = "easeOutQuint", style = "popin 87%" })
      hl.animation({ leaf = "windowsOut",    enabled = true, speed = 1.49, bezier = "linear",       style = "popin 87%" })
      hl.animation({ leaf = "fadeIn",        enabled = true, speed = 1.73, bezier = "almostLinear" })
      hl.animation({ leaf = "fadeOut",       enabled = true, speed = 1.46, bezier = "almostLinear" })
      hl.animation({ leaf = "fade",          enabled = true, speed = 3.03, bezier = "quick" })
      hl.animation({ leaf = "layers",        enabled = true, speed = 3.81, bezier = "easeOutQuint" })
      hl.animation({ leaf = "layersIn",      enabled = true, speed = 4,    bezier = "easeOutQuint", style = "fade" })
      hl.animation({ leaf = "layersOut",     enabled = true, speed = 1.5,  bezier = "linear",       style = "fade" })
      hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 1.79, bezier = "almostLinear" })
      hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
      hl.animation({ leaf = "workspaces",    enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
      hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
      hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })

      -- i3-like binds
      hl.bind(mod .. " + Return", hl.dsp.exec_cmd(terminal))
      hl.bind(mod .. " + d", hl.dsp.exec_cmd(menu))
      hl.bind(mod .. " + SHIFT + q", hl.dsp.window.close())

      -- Hyprland binds
      hl.bind(mod .. " + m", hl.dsp.exit())
      hl.bind(mod .. " + p", hl.dsp.window.pseudo({}))
      hl.bind(mod .. " + s", hl.dsp.layout("togglesplit"))
      hl.bind(mod .. " + f", hl.dsp.window.float({ action = "toggle" }))

      -- Move focus
      hl.bind(mod .. " + h", hl.dsp.focus({ direction = "left" }))
      hl.bind(mod .. " + l", hl.dsp.focus({ direction = "right" }))
      hl.bind(mod .. " + j", hl.dsp.focus({ direction = "down" }))
      hl.bind(mod .. " + k", hl.dsp.focus({ direction = "up" }))

      -- Switch workspaces
      hl.bind(mod .. " + 1", hl.dsp.focus({ workspace = "1" }))
      hl.bind(mod .. " + 2", hl.dsp.focus({ workspace = "2" }))
      hl.bind(mod .. " + 3", hl.dsp.focus({ workspace = "3" }))
      hl.bind(mod .. " + 4", hl.dsp.focus({ workspace = "4" }))
      hl.bind(mod .. " + 5", hl.dsp.focus({ workspace = "5" }))
      hl.bind(mod .. " + 6", hl.dsp.focus({ workspace = "6" }))
      hl.bind(mod .. " + 7", hl.dsp.focus({ workspace = "7" }))
      hl.bind(mod .. " + 8", hl.dsp.focus({ workspace = "8" }))
      hl.bind(mod .. " + 9", hl.dsp.focus({ workspace = "9" }))
      hl.bind(mod .. " + 0", hl.dsp.focus({ workspace = "10" }))

      -- Move active window to workspace
      hl.bind(mod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = "1" }))
      hl.bind(mod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = "2" }))
      hl.bind(mod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = "3" }))
      hl.bind(mod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = "4" }))
      hl.bind(mod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = "5" }))
      hl.bind(mod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = "6" }))
      hl.bind(mod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = "7" }))
      hl.bind(mod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = "8" }))
      hl.bind(mod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = "9" }))
      hl.bind(mod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = "10" }))

      -- Mouse binds
      hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
      hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
    '';
  };

  services.hypridle = {
    enable = true;
    settings = {
      listener = [
        {
          timeout = 150;
          on-timeout = "brightnessctl -s set 10";
          on-resume = "brightnessctl -r";
        }
        {
          timeout = 300;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on && brightnessctl -r";
        }
      ];
    };
  };
}
