{ pkgs, ... }: {
  programs.helix = {
    enable = true;
    defaultEditor = true;

    extraPackages = [
      pkgs.nil
      pkgs.nixfmt
    ];

    settings = {
      editor = {
        auto-save = true;
        bufferline = "multiple";
        soft-wrap.enable = true;
        end-of-line-diagnostics = "hint";
        line-number = "relative";
        preview-completion-insert = false;
        color-modes = true;

        terminal = {
          command = "bash";
          args = [ "-c" ];
        };

        file-picker.hidden = false;

        lsp = {
          display-inlay-hints = true;
          display-messages = true;
          display-progress-messages = true;
        };

        inline-diagnostics = {
          cursor-line = "error";
          other-lines = "error";
        };
      };

      keys = {
        normal = {
          C-l = [
            "kill_to_line_end"
            "insert_mode"
          ];
          C-h = [
            "kill_to_line_start"
            "insert_mode"
          ];
        };
      };
    };

    languages = {
      language = [
        {
          name = "nix";
          formatter.command = "nixfmt";
          auto-format = true;
        }
      ];
    };
  };
}
