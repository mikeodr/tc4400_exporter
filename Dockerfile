FROM golang:alpine AS builder
RUN apk add git
RUN go install github.com/mikeodr/tc4400_exporter@latest
FROM alpine:latest
COPY --from=builder /go .
EXPOSE 9623/tcp
CMD ["tc4400_exporter"]
