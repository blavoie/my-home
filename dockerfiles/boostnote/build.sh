#!/bin/sh
time docker build -t boostnote .
docker run -it --name boostnote local/boostnote true
docker cp boostnote:/boostnote/dist/ ./dist/
docker rm boostnote
