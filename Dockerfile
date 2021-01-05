##########################
# Build
##########################

FROM golang:1.15.6 as builder

WORKDIR /go/src

RUN curl -L https://github.com/golang-migrate/migrate/releases/download/v4.14.1/migrate.linux-amd64.tar.gz | tar xvz

COPY go.mod go.sum ./

RUN go mod download

COPY . .

ARG CGO_ENABLED=0
ARG GOOS=linux
ARG GOARCH=amd64

RUN go build -o main -ldflags '-s -w'

##########################
# Run
##########################

FROM alpine:3.7 as runner

COPY --from=builder \
    /go/src/main \
    /go/src/migrate.linux-amd64 \
    /go/src/migration \
    /go/src/start.sh \
    /app/

ENTRYPOINT ["/app/start.sh"]
