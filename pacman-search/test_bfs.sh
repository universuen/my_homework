#!/bin/bash

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [ -d build ]; then
   rm -rf build
fi

mkdir build

gcc src/util.c src/bfs.c -std=c99 -o build/bfs.out

if [ ! -f build/bfs.out ]; then
    echo 'compile failed'
    exit
fi

cd base
python2 pacman.py -l tinyMaze -p SearchAgent -a fn=bfs
python2 pacman.py -l mediumMaze -p SearchAgent -a fn=bfs
python2 pacman.py -l bigMaze -z .5 -p SearchAgent -a fn=bfs

