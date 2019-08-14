#!/bin/bash

#
# Cleanup stuff
#

function help {
    echo "Usage: $0 {docker,cache}"
    exit 1
}

function docker-help {
    echo "Usage: $0 docker {all,containers,images,volumes}"
    exit 1
}

function cache-help {
    echo "Usage: $0 cache {pacman}"
    exit 1
}

function cleanup-docker {
    case "$1" in
        all)
            cleanup-docker "containers"
            cleanup-docker "images"
            cleanup-docker "volumes"
        ;;

        containers)
            containers=$(docker ps -a -q)
            if [ -z $containers ]; then
                echo "No containers found"
            else
                docker rm $containers
            fi
        ;;

        images)
            images=$(docker images -a -q)
            if [ -z $images ]; then
                echo "No images found"
            else
                docker rmi -f $images
            fi
        ;;

        volumes)
            volumes=$(docker volume ls -q)
            if [ -z $volumes ]; then
                echo "No volumes found"
            else
                docker volume rm $volumes
            fi
        ;;

        *)
            docker-help
    esac
}

function cleanup-cache {
    case "$1" in
        pacman)
            paccache -r
        ;;

        *)
            cache-help
    esac
}

case "$1" in
    docker)
        cleanup-docker $2
    ;;

    cache)
        cleanup-cache $2
    ;;

    *)
        help
esac
