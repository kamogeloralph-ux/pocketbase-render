FROM alpine:latest

# Use the latest stable PocketBase version
ARG PB_VERSION=0.22.21

RUN apk add --no-cache unzip openssh ca-certificates

ADD https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip /tmp/pb.zip

RUN unzip /tmp/pb.zip -d /pb/
RUN chmod +x /pb/pocketbase

EXPOSE 8080

CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8080"]
