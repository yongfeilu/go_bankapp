# Build stage
FROM golang:1.18.2-alpine3.15 AS builder
WORKDIR /app
COPY . .
RUN go build -o main main.go
RUN apk add curl
RUN curl -L https://github.com/golang-migrate/migrate/releases/download/v4.15.2/migrate.linux-amd64.tar.gz | tar xvz

# Run stage
FROM alpine:3.15
WORKDIR /app
COPY --from=builder /app/main .
COPY --from=builder /app/migrate ./migrate
COPY app.env .
COPY start.sh .
COPY wait-for.sh .
COPY db/migration ./migration

EXPOSE 8080
#Keep in mind that when the CMD instruction is used together with ENTRYPOINT,
#It will act as just the additional parameters
#that will be passed into the entry point script.
CMD ["/app/main"]
ENTRYPOINT ["/app/start.sh"]

