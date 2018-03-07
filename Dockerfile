FROM alpine:latest as temp
RUN apk --no-cache add curl unzip ca-certificates
RUN curl -sLo rclone.zip https://downloads.rclone.org/rclone-v1.39-linux-amd64.zip
RUN unzip -j rclone.zip *rclone
RUN chmod +x rclone

FROM alpine:latest
RUN apk --no-cache add ca-certificates
COPY --from=temp /rclone /usr/bin/rclone
ENTRYPOINT ["/usr/bin/rclone"]
CMD ["--help"]
