FROM golang:1.15.1-alpine3.12 as builder

WORKDIR /home

COPY go.* ./
RUN go mod download
COPY . ./

RUN CGO_ENABLED=0 GOOS=linux go build -o hello


FROM alpine:latest

ENV PORT 8080

RUN apk update && apk --no-cache --update add ca-certificates

COPY --from=builder /home/hello /hello
RUN chmod a+x /hello

CMD ["/hello"]