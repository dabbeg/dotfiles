#!/bin/bash

#
# Cleanup stuff
#

function help {
    echo "Usage: $0 {docker}"
    exit 1
}

function cleanup-docker {
    case "$1" in
        images)
            docker rmi $(docker images -a -q)
        ;;

        containers)
            docker rm $(docker ps -a -q)
        ;;

        *)
            help
    esac
}

case "$1" in
    docker)
        cleanup-docker $2
    ;;

    *)
        help
esac
