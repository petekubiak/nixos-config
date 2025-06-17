{ config, lib, ... }: {
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
          "interval" = 1;
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

    style = lib.mkAfter ''
      * {
        font-family: "Sauce Code Pro Nerd Font";
        font-size: 15px;
      }

      window#waybar {
        background: transparent;
        color: @base04;
        border-radius: 7rem;
        border-width: 2px;
        border-style: solid;
        border-color: @base04;
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
          color: @base06;
      }

    #workspaces {
      border-radius: 7rem;
      background-color: transparent;
      /*border-width: 2px;
      border-style: solid;
      border-color: @base04;*/
    }

    #workspaces button {
      color: @base04;
      border-radius: 7rem;
    }

    #workspaces button.active {
      color: @brown;
      background-color: @base04;
      border-radius: 7rem;
    }

    #workspaces button:hover {
      color: @brown;
      background-color: @base06;
      border-radius: 7rem;
    }

    #window {
      border-radius: 7rem;
      padding: 0 10px;
      background-color: transparent;
      color: @base04;
      margin-left: 5px;
      margin-right: 5px;
    }
    '';
  };
}
