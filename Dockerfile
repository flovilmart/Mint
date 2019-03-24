# By default build with the latest swift version
ARG SWIFT_VERSION=latest
# The branch of the mint repo to build from
# those environment variables come from https://docs.docker.com/docker-hub/builds/advanced/
ARG SOURCE_BRANCH=master
ARG SOURCE_COMMIT=HEAD

FROM swift:${SWIFT_VERSION}
RUN mkdir -p /tmp
RUN git clone --branch ${SOURCE_BRANCH} https://github.com/yonaskolb/Mint.git /tmp/Mint
WORKDIR /tmp/Mint
RUN git checkout ${SOURCE_COMMIT}
RUN swift run mint install yonaskolb/mint

