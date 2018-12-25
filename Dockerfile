ARG DOTNET_VERSION=2

FROM microsoft/dotnet:${DOTNET_VERSION}-sdk as builder
WORKDIR /repo
COPY . .
RUN export DOTNET_CLI_TELEMETRY_OPTOUT=1 \
 && rm -rf MediaBrowser.Controller \
 && cp -r ThirdParty/Emby.Common/MediaBrowser.Controller . \
 && dotnet clean \
 && dotnet publish --configuration release --output /jellyfin

FROM microsoft/dotnet:${DOTNET_VERSION}-runtime
COPY --from=builder /jellyfin /jellyfin
EXPOSE 8096
RUN apt update \
 && apt install -y ffmpeg
VOLUME /config /media
ENTRYPOINT if [ -n "$PUID$PGUID" ]; \
    then echo "PUID/PGID are deprecated. Use Docker user param." >&2; exit 1; \
    else dotnet /jellyfin/jellyfin.dll -programdata /config; fi
