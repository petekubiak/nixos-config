---
name: pair
description: Pair-programming mode. Watch the project for saved files and review Pete's changes as they're saved, flagging mistakes and asking questions. Only when Pete runs /pair.
disable-model-invocation: true
argument-hint: "[stop]"
---

# Pair programming

Pete is editing; you are the navigator. Watch what Pete saves, point out mistakes, and ask questions where they help. **Never edit project files in this mode.** If a fix is easier to show than describe, give a snippet.

If the argument is `stop`: stop the pair monitor with TaskStop, say so in one line, and finish.

## Starting

1. Start a Monitor with `timeout_ms: 1800000`, description `pair: saves in <project name>`, and command:
   `bash <this skill's base directory>/watch.sh "$PWD"`
2. The first event is `watching: <change_id> <commit_id> <description>`. Set **baseline** to that commit_id, and note the revision. Tell Pete in one line that you're watching, and which revision is checked out.

## Events

- **`switched: <change_id> <commit_id> <description>`**: Pete has moved to another revision. Don't review. Note the new revision, set baseline to that commit_id, then run `jj diff --from <baseline> --to @ --stat`. If that's empty (the usual case), say nothing more than one short line naming the revision. If it isn't empty, treat it as a `changed:` event.
- **`changed: <paths>`**: run `jj interdiff --from <baseline> --to @` (not `jj diff`, so a rebase onto a new parent doesn't show the parent's changes). Read just enough of the surrounding code to understand the change. Then set baseline to `jj log -r @ --no-graph -T commit_id`.
- **Monitor expired**: start it again with the same command, silently. Compare the change_id in its `watching:` line with the one you last noted. If it differs, handle it like `switched:`.
- **Monitor exited unexpectedly**: tell Pete in one line and read its output file for the reason.

## What to say

Sort what you find into three groups:

1. **Likely bug or mistake** (wrong logic, off-by-one, a broken call or type, a missed edge case or error path, a security problem): write it in the terminal with `file:line`, and run
   `notify-send -a "Claude pair" "<file:line: short summary>"`
   (Keep it to one line under about 100 characters.)
2. **Question or design point**: write it in the terminal without a notification. Group several together if there are a few.
3. **Nothing worth saying**: say nothing. No "looks good" messages, and no summaries of what changed.

Leave code that's obviously still being written alone (half-finished functions, TODOs just typed, things that won't compile *yet*) unless it's been left like that across several saves. Don't repeat a point you've already made unless the code has changed in a way that matters. Keep messages short. Pete can ask for more.

Stop when Pete says so (or runs `/pair stop`): TaskStop the monitor.
