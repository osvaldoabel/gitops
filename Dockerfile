FROM golang:1.21 as builder

WORKDIR /app
COPY . . 
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64  go build -o server


FROM builder 
WORKDIR /app
COPY --from=builder /app/server .
# EXPOSE 8083
ENTRYPOINT [ "./server" ]