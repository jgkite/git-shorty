#!/bin/bash

SAY_WHEN_ENABLED="Saving keystrokes, one commit at a time."
SAY_WHEN_DISABLED="You must get paid by the keystroke."
KNOWN_ALIAS="st"

COMMAND="$1"

aliases_are_enabled()
{
  if git config --global --get alias.$KNOWN_ALIAS > /dev/null; then
    return 0 # true
  else
    return 1 # false
  fi
}

enable_aliases()
{
  git config --global --rename-section alias-disabled alias
}

disable_aliases()
{
  git config --global --rename-section alias alias-disabled
}

usage()
{
  echo >&2
  echo "USAGE:"
  echo >&2
  echo "To turn on git aliases:"
  echo "  git-shorty on"
  echo "To turn off git aliases:"
  echo "  git-shorty off"
}

case "$COMMAND" in
"on")
  echo "Turning aliases on..."
  if aliases_are_enabled; then
    echo "Git aliases are already enabled. $SAY_WHEN_ENABLED"
  else
    enable_aliases
    echo "Git aliases are enabled. $SAY_WHEN_ENABLED"
  fi
  ;;
"off")
  echo "Turning aliases off..."
  if aliases_are_enabled; then
    disable_aliases
    echo "Git aliases are now disabled. $SAY_WHEN_DISABLED"
  else
    echo "Git aliases are already disabled. $SAY_WHEN_DISABLED"
  fi
  ;;
*)
  echo "I don't understand \"$COMMAND\". :)" && usage
  exit 1
esac
