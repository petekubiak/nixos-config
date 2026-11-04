{ lib, pkgs, ... }: {
  home.packages = [
    pkgs.bluetui
  ];

  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        fixed-center = false;
        margin-top = 2;
        margin-left = 2;
        margin-right = 2;
        margin-bottom = 1;
        spacing = 4;
        height = 32;

        modules-left = [
          "hyprland/workspaces"
        ];

        modules-center = [
          "hyprland/window"
        ];

        modules-right = [
          "idle_inhibitor"
          "pulseaudio"
          "cpu"
          "memory"
          "temperature"
          "backlight"
          "battery"
          "network"
          "bluetooth"
          "tray"
          "clock"
        ];

        "idle_inhibitor" = {
          "format" = "{icon}";
          "format-icons" = {
            "activated" = "";
            "deactivated" = "";
          };
        };

        "pulseaudio" = {
          "format" = "{volume}% {icon} {format_source}";
          "format-bluetooth" = "{volume}% {icon} {format_source}";
          "format-bluetooth-muted" = " {icon}󰂯 {format_source}";
          "format-muted" = " {format_source}";
          "format-source" = "{volume}% ";
          "format-source-muted" = "";
          "format-icons" = {
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = [
              ""
              ""
              ""
            ];
          };
          "on-click" = "pavucontrol";
        };

        "cpu" = {
          "format" = "{usage}% ";
        };

        "memory" = {
          "format" = "{}% ";
        };

        "temperature" = {
          "critical-threshold" = 80;
          "format" = "{temperatureC}°C {icon}";
          "format-icons" = [
            ""
            ""
            "󰸁"
          ];
        };

        "backlight" = {
          "format" = "{percent}% {icon}";
          "format-icons" = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
        };

        "battery" = {
          "states" = {
            "warning" = 30;
            "critical" = 10;
          };
          "format" = "{capacity}% {icon}";
          "format-full" = "{capacity}% {icon}";
          "format-charging" = "{capacity}% {icon}󱐋";
          "format-plugged" = "{capacity}% ";
          "format-alt" = "{time} {icon}";
          "format-icons" = [
            ""
            ""
            ""
            ""
            ""
          ];
        };

        "network" = {
          "format-wifi" = "{essid} ({signalStrength}%) ";
          "format-ethernet" = "{ipaddr}/{cidr} 󰈁";
          "tooltip-format" = "{ifname} via {gwaddr}";
          "format-linked" = "{ifname} (No IP)";
          "format-disconnected" = "Disconnected 󰖪";
          "format-alt" = "{ifname}: {ipaddr}/{cidr}";
          "on-click" = "alacritty --class nmtui-connect -e nmtui-connect";
        };

        "bluetooth" = {
          "format" = "{num_connections} ";
          "tooltip-format" = "{controller_alias}: no devices connected";
          "tooltip-format-connected" = "{device_enumerate}";
          "tooltip-format-enumerate-connected" = "{device_alias}";
          "tooltip-format-enumerate-connected-battery" = "{device_alias} {device_battery_percentage}% 󰁹";
          "on-click" = "alacritty --class bluetui -e bluetui";
        };

        "clock" = {
          "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          "format-alt" = "{:%Y-%m-%d}";
        };
      };
    };

    style = lib.mkAfter /* css */ ''
      * {
        font-family: "SauceCodePro Nerd Font Propo";
        font-size: 15px;
      }

      window#waybar {
        background: transparent;
        border: none;
      }

      window#waybar > box {
        background-color: alpha(@base00, 0.9);
        color: @base04;
        border-radius: 7rem;
        border: 2px solid @base04;
      }

      window#waybar.empty #window {
        background-color: transparent;
        padding: 0px;
        border: 0px;
      }

      #workspaces button {
        color: @base04;
        border-radius: 7rem;
        min-height: 0;
        padding: 0 6px;
      }

      #workspaces button.active {
        color: @base06;
        border: none;
      }

      #workspaces button:hover {
        background: alpha(@base02, 0.2);
      }

      #idle_inhibitor,
      #pulseaudio,
      #cpu,
      #memory,
      #temperature,
      #backlight,
      #battery,
      #network,
      #bluetooth,
      #tray,
      #clock {
        border-radius: 6px;
        transition: box-shadow 150ms ease;
      }

      #clock {
        border-radius: 6px 7rem 7rem 6px;
      }

      #idle_inhibitor:hover,
      #pulseaudio:hover,
      #cpu:hover,
      #memory:hover,
      #temperature:hover,
      #backlight:hover,
      #battery:hover,
      #network:hover,
      #bluetooth:hover,
      #tray:hover,
      #clock:hover {
        box-shadow: inset 0 -3px @base07;
      }
    '';
  };
}
