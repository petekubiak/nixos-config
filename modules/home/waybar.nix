{ config, ... }: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        fixed-center = false;
        margin-left = 10;
        margin-right = 10;
        modules-left = [
          "hyprland/workspaces"
        ];
        modules-center = [
          "hyprland/window"
        ];
        modules-right = [
          "cpu"
          "temperature"
          "memory"
          "disk"
          "temperature#disk"
          "network"
          "network#upspeed"
          "network#downspeed"
          "bluetooth"
          "wireplumber"
          "clock"
          "tray"
        ];

        "cpu" = {
          "interval" = 5;
          "format" = "{load} {usage:>2}% {icon0}{icon1}{icon2}{icon3}{icon4}{icon5}{icon6}{icon7}{icon8}{icon9}{icon10}{icon11}{icon12}{icon13}{icon14}{icon15} {max_frequency} GHz ";
          "format-icons" = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
        };

        "temperature" = {
          "format" = "{temperatureC} °C ";
          "format-warning" = "{temperatureC} °C ";
          "format-critical" = "{temperatureC} °C ";
          "warning-threshold" = 80;
          "critical-threshold" = 85;
          "hwmon-path" = "/sys/class/hwmon/hwmon1/temp1_input";
          "tooltip" = false;
        };

        "memory" = {
          "format" = " {avail:0.1f} GiB / {swapAvail} GiB 󰿡";
          "states" = {
            "warning" = 80;
            "critical" = 95;
          };
        };

        "disk" = {
          "format" = "{free} ";
          "states" = {
            "warning" = 80;
            "critical" = 95;
          };
        };

        "temperature#disk" = {
          "hwmon-path" = "/sys/class/hwmon/hwmon0/temp1_input";
          "format" = "{temperatureC} °C ";
          "format-warning" = "{temperatureC} °C ";
          "format-critical" = "{temperatureC} °C ";
          "warning-threshold" = 60;
          "critical-threshold" = 80;
          "tooltip" = false;
        };

          "network" = {
          "format" = "{ifname}";
          "format-wifi" = "{icon} {signalStrength}%";
          "format-ethernet" = "󰈁";
          "format-disconnected" = "";
          "format-disabled" = "󱞐";
          "format-icons" = [ "󰤯" "󰤟" "󰤢" "󰤥" "󰤨" ];
          "tooltip-format-wifi" = "{ipaddr} @ {essid}";
        };

        "network#upspeed" = {
          "interval" = 1;
          "format" = "{ifname}";
          "format-wifi" = " {bandwidthUpBytes:<3}";
          "format-ethernet" = " {bandwidthUpBytes:<3}";
          # "min-length" = 11;
          "tooltip" = false;
          "justify" = "left";
          "align" = 0;
        };

        "network#downspeed" = {
          "interval" = 1;
          "format" = "{ifname}";
          "format-wifi" = "{bandwidthDownBytes:>3} ";
          "format-ethernet" = "{bandwidthDownBytes:>3} ";
          # "min-length" = 11;
          "tooltip" = false;
          "justify" = "right";
          "align" = 1;
        };

        "wireplumber" = {
          "format" = "{volume}% ";
          "format-muted" = "";
        };

        "clock" = {
          "tooltip-format" = "{calendar}";
          "actions" = {
            "on-click" = "mode";
            "on-scroll-up" = "shift_up";
            "on-scroll-down" = "shift_down";
          };
        };
      };
    };

    style = ''
      @define-color rosewater #f5e0dc;
      @define-color flamingo #f2cdcd;
      @define-color pink #f5c2e7;
      @define-color mauve #cba6f7;
      @define-color red #f38ba8;
      @define-color maroon #eba0ac;
      @define-color peach #fab387;
      @define-color yellow #f9e2af;
      @define-color green #a6e3a1;
      @define-color teal #94e2d5;
      @define-color sky #89dceb;
      @define-color sapphire #74c7ec;
      @define-color blue #89b4fa;
      @define-color lavender #b4befe;
      @define-color text #cdd6f4;
      @define-color subtext1 #bac2de;
      @define-color subtext0 #a6adc8;
      @define-color overlay2 #9399b2;
      @define-color overlay1 #7f849c;
      @define-color overlay0 #6c7086;
      @define-color surface2 #585b70;
      @define-color surface1 #45475a;
      @define-color surface0 #313244;
      @define-color base #1e1e2e;
      @define-color mantle #181825;
      @define-color crust #11111b;
      @define-color brown #561508;

      * {
        font-family: "Sauce Code Pro Nerd Font";
        font-size: 15px;
      }

      window#waybar {
        background: transparent;
        color: @teal;
        border-radius: 7rem;
        border-width: 2px;
        border-style: solid;
        border-color: @teal;
      }

      window#waybar.empty #window {
        background-color: transparent;
        padding: 0px;
        border: 0px;
      }

      #clock,
      #battery,
      #cpu,
      #memory,
      #disk,
      #temperature,
      #backlight,
      #network,
      #pulseaudio,
      #wireplumber,
      #tray,
      #bluetooth,
      #mode,
      #idle-inhibitor,
      #scratchpad,
      #power-profiles-daemon,
      #language,
      #mpd {
        background-color: transparent;
        padding: 0 10px;
        border-radius: 7rem;
      }

      #clock:hover,
      #battery:hover,
      #cpu:hover,
      #memory:hover,
      #disk:hover,
      #backlight:hover,
      #network:hover,
      #pulseaudio:hover,
      #wireplumber:hover,
      #custom-media:hover,
      #tray:hover,
      #mode:hover,
      #bluetooth:hover,
      #idle_inhibitor:hover,
      #scratchpad:hover,
      #power-profiles-daemon:hover,
      #language:hover,
      #mpd:hover {
          color: @green;
      }

    #workspaces {
      border-radius: 7rem;
      background-color: transparent;
      /*border-width: 2px;
      border-style: solid;
      border-color: @teal;*/
    }

    #workspaces button {
      color: @teal;
      border-radius: 7rem;
    }

    #workspaces button.active {
      color: @brown;
      background-color: @teal;
      border-radius: 7rem;
    }

    #workspaces button:hover {
      color: @brown;
      background-color: @green;
      border-radius: 7rem;
    }

    #window {
      border-radius: 7rem;
      padding: 0 10px;
      background-color: transparent;
      color: @teal;
      margin-left: 5px;
      margin-right: 5px;
    }
    '';
  };
}
