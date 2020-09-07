FROM golang:1.15.1-alpine3.12 as builder

WORKDIR /home

COPY go.* ./
RUN go mod download
COPY . ./

RUN CGO_ENABLED=0 GOOS=linux go build -o hello


FROM scratch

ENV PORT 8080

COPY --from=builder /home/hello /hello

CMD ["/hello"]