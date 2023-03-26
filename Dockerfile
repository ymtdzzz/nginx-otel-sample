FROM golang:1.20.1-alpine3.17 as build

WORKDIR /go/nginx-tracing

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN go build -o nginx-tracing

FROM alpine:3.17

WORKDIR /nginx-tracing

COPY --from=build /go/nginx-tracing .

