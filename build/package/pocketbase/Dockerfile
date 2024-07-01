# Pocketbase backend build
FROM golang:1.19 as build
WORKDIR /go/src/github.com/natrongmbh/next-pocket
# RUN go get -d -v golang.org/x/net/html
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o next-pocket ./cmd/next-pocket

# Production build
FROM alpine:3.16

WORKDIR /app

RUN addgroup -g 1001 -S next-pocket
RUN adduser -S next-pocket -u 1001

RUN apk --no-cache add ca-certificates

COPY --from=build --chown=next-pocket:next-pocket /go/src/github.com/natrongmbh/next-pocket/next-pocket ./

EXPOSE 8090

CMD ["./next-pocket", "serve", "--http=0.0.0.0:8090"]
