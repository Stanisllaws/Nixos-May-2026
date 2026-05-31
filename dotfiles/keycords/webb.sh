#!/bin/sh

echo "Press 'c' to launch Chromium, 'b' to launch Brave (or any other key to exit):"

# Read a single keystroke silently
if read -n1 -s -r key; then
    case "$key" in
        c|C)
            echo
            echo "Launching Chromium..."
            chromium &>/dev/null &
            ;;
        b|B)
            echo
            echo "Launching Brave..."
            brave &>/dev/null &
            ;;
        *)
            echo
            echo "Pressed: $key. Exiting."
            ;;
    esac
fi
