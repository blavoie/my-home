#!/bin/sh
time docker build -t local/boostnote .
docker run -it --name boostnote local/boostnote true
docker cp boostnote:/boostnote/dist/ .
docker rm boostnote
