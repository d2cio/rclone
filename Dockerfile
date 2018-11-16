FROM alpine:3.6 as temp
RUN apk --no-cache add curl unzip ca-certificates
RUN curl -sLo rclone.zip https://downloads.rclone.org/v1.44/rclone-v1.44-linux-amd64.zip
RUN unzip -j rclone.zip *rclone
RUN chmod +x rclone

FROM alpine:3.6
RUN apk --no-cache add ca-certificates
COPY --from=temp /rclone /usr/bin/rclone
ENTRYPOINT ["/usr/bin/rclone"]
CMD ["--help"]
