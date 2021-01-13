#!/bin/sh

appname="$1"
summary="$2"
body="$3"
icon="$4"
urgency="$5"

## Filter

# set nocasematch option
shopt -s nocasematch

# TODO: Filter
exit

# unset nocasematch option
shopt -u nocasematch

reply_action () {
    :
}

forward_action () {
    :
}

handle_dismiss () {
    xdotool search --classname --onlyvisible "discord" \
    | xargs dwm-msg get_dwm_client \
    | jq '.tags' \
    | xargs dwm-msg run_command view
}

ACTION=$(dunstify \
         --action="default,Reply" \
         --action="forwardAction,Forward" \
         -i "$icon" \
         -u "$urgency" \
         "$summary" \

         "$body")

case "$ACTION" in
"default")
    reply_action
    ;;
"forwardAction")
    forward_action
    ;;
"2")
    handle_dismiss
    ;;
esac
