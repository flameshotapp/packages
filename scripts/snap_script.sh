#!/bin/bash --

set -e
docker exec -i snap-builder snapcraft clean
docker exec -i snap-builder snapcraft

# docker exec -i snap-builder snapcraft enable-ci travis --refresh

# move snap package
cd flameshot
mkdir results
docker exec -i snap-builder sh -c "mv flameshot_*.snap flameshot_amd64.snap"
# docker cp still doesn't support wildcards
docker cp snap-builder:$SRC_PATH/flameshot_amd64.snap results/flameshot_${VERSION}_amd64_`git describe --always`.snap
