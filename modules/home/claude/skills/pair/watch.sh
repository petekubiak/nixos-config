#!/usr/bin/env bash
# Watch a jj repository for saved files and print one line per batch of changes.
#   watching: <change_id> <commit_id> <description>   (once, at start)
#   switched: <change_id> <commit_id> <description>   (@ moved to another change)
#   changed:  <path> <path> ...                        (files saved on the same change)
# Events are debounced: nothing is printed until QUIET seconds pass with no saves.
set -u
cd "${1:-.}" || exit 1
QUIET=${PAIR_QUIET:-20}

rev() {
  jj log -r @ --ignore-working-copy --no-graph \
    -T 'change_id.short() ++ " " ++ commit_id ++ " " ++ description.first_line()'
}

start=$(rev) || exit 1
echo "watching: $start"
last_change=${start%% *}

inotifywait -m -r -q -e close_write,moved_to,delete \
  --exclude '(^|/)(\.git|\.jj|node_modules|target|result|build)(/|$)' \
  --format '%w%f' . |
{
  pending=()
  while true; do
    if IFS= read -r -t "$QUIET" path; then
      git check-ignore -q "$path" 2>/dev/null || pending+=("${path#./}")
    else
      (( $? > 128 )) || exit 0          # EOF: inotifywait has exited
      (( ${#pending[@]} )) || continue  # quiet, nothing pending
      cur=$(rev) || continue
      change=${cur%% *}
      if [[ $change != "$last_change" ]]; then
        echo "switched: $cur"
        last_change=$change
      else
        echo "changed: $(printf '%s\n' "${pending[@]}" | sort -u | paste -sd' ')"
      fi
      pending=()
    fi
  done
}
