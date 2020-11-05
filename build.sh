docker build -t pakzer0/jamulus:latest . ; docker run -ti -v "$PWD/build/":/opt/build pakzer0/jamulus:latest /bin/bash
# docker run --rm --name jamulus_build -ti pakzer0/jamulus:latest bash
# docker run -ti -v "$PWD/opt":/opt pakzer0/jamulusbuilt:latest /bin/bash
