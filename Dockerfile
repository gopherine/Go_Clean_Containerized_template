# First stage: Build the application
FROM golang:alpine AS builder

ARG SHORT_SHA

# Add CA Certificates
RUN apk --no-cache add ca-certificates

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN GOOS=linux GOARCH=amd64 go build -ldflags="-X main.shortSHA=${SHORT_SHA}" -o main ./cmd/api/main.go

# Second stage: Create the final Docker image
FROM alpine:latest

RUN apk --no-cache add ca-certificates

WORKDIR /root/

# Copy the binary from the builder stage
COPY --from=builder /app/main .

EXPOSE 1323

CMD ["./main"]
