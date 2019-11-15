#!/bin/bash
#
# Stored and run from ~/Library/LaunchAgents/com.mike.mbsync.plist
#
# launchctl unload ~/Library/LaunchAgents/com.mike.mbsync.plist
# launchctl load ~/Library/LaunchAgents/com.mike.mbsync.plist
set -e

### from http://www.holgerschurig.de/en/notmuch-polling-with-mbsync/
sync_mail()
{
    local CHANNELS

    if [ -z "$*" ]; then
        CHANNELS=`awk '/^Channel/ { print $2; }' ~/.mbsyncrc | sort | uniq`
    else
        CHANNELS="$*"
    fi

    for i in $CHANNELS; do
        echo "- syncing mail in $i"
        /usr/local/bin/mbsync -q  $i
    done
}

sync_mail "$*"
/usr/local/bin/notmuch new
