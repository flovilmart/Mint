# By default build with the latest swift version
ARG SWIFT_VERSION=latest

FROM swift:${SWIFT_VERSION}

WORKDIR /tmp/Mint
COPY . .

RUN swift build --disable-sandbox -c release --product mint
RUN cp -f .build/release/mint /usr/local/bin

CMD mint
