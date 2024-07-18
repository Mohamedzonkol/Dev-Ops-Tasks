#!/usr/bin/env bash
#   Use this script to test if a given TCP host/port are available

# Original: https://github.com/vishnubob/wait-for-it

set -e

TIMEOUT=15
QUIET=0
while getopts "q" opt; do
    case "$opt" in
    q) QUIET=1 ;;
    esac
done
shift $((OPTIND-1))

HOST="$1"
PORT="$2"

if [ -z "$HOST" -o -z "$PORT" ]; then
    echo "Usage: $0 [-q] host port"
    exit 1
fi

wait_for() {
    for i in $(seq $TIMEOUT); do
        if nc -z "$HOST" "$PORT"; then
            if [ $QUIET -ne 1 ]; then
                echo "Connection to $HOST:$PORT succeeded!"
            fi
            return 0
        fi
        sleep 1
    done
    echo "Connection to $HOST:$PORT failed after $TIMEOUT seconds"
    exit 1
}

wait_for
