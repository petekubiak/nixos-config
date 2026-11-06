{
  lib,
  pkgs-unstable,
  ...
}:
{
  programs.starship = {
    enable = true;
    package = pkgs-unstable.starship;
    presets = [ "jetpack" ];
    extraPackages = [ pkgs-unstable.jj-starship ];

    settings = {
      jj_bookmark = {
        symbol = "";
        truncation_length = 32;
        style = "italic purple";
      };

      sudo = {
        symbol = "";
      };

      battery = {
        full_symbol = "󰁹";
        charging_symbol = "󰁾[↑](italic bold green)";
        discharging_symbol = "󰁾↓";
        unknown_symbol = "󰚥";
        empty_symbol = "󰁺";
      };

      python = {
        format = "$symbol[$version](italic dimmed yellow)";
        symbol = " [󰌠](#306998)";
        version_format = "v$raw";
      };

      cmake = {
        format = "$symbol[$version](italic dimmed yellow)";
        symbol = "[via](italic) [](#064F8C)";
      };

      c = {
        format = "[$symbol](#B0C4DE)[$version-$name](italic dimmed yellow)";
        symbol = "";
      };

      directory = {
        home_symbol = "";
        truncation_length = 3;
        truncation_symbol = "/";
        repo_root_format = "[$before_root_path]($before_repo_root_style)[$repo_root]($repo_root_style)[$path]($style)[$read_only]($read_only_style)";
      };

      nix_shell = {
        symbol = "";
      };

      format = lib.concatStrings [
        "($nix_shell$container$fill$jj_metrics\n)"
        "$cmd_duration"
        "$hostname"
        "$localip"
        "$shlvl"
        "$shell"
        "$env_var"
        "$sudo"
        "$jobs"
        "$username"
        "$character"
      ];

      right_format = lib.concatStrings [
        "$singularity"
        "$kubernetes"
        "$directory "
        "$vcsh"
        "$fossil_branch"
        "($jj_bookmark )"
        "($jj_status )"
        "$hg_branch"
        "$pijul_channel"
        "$docker_context"
        "$package"
        "$c"
        "$cpp"
        "$cmake"
        "$cobol"
        "$daml"
        "$dart"
        "$deno"
        "$dotnet"
        "$elixir"
        "$elm"
        "$erlang"
        "$fennel"
        "$fortran"
        "$golang"
        "$guix_shell"
        "$haskell"
        "$haxe"
        "$helm"
        "$java"
        "$julia"
        "$kotlin"
        "$gradle"
        "$lua"
        "$maven"
        "$nim"
        "$nodejs"
        "$bun"
        "$ocaml"
        "$opa"
        "$perl"
        "$php"
        "$pulumi"
        "$purescript"
        "$python"
        "$raku"
        "$rlang"
        "$red"
        "$ruby"
        "$rust"
        "$scala"
        "$solidity"
        "$swift"
        "$terraform"
        "$vlang"
        "$vagrant"
        "$xmake"
        "$zig"
        "$buf"
        "$conda"
        "$pixi"
        "$meson"
        "$spack"
        "$memory_usage"
        "$aws"
        "$gcloud"
        "$openstack"
        "$azure"
        "$crystal"
        "$custom"
        "$status"
        "$os"
        "$battery"
        "$time"
      ];
    };
  };
}
