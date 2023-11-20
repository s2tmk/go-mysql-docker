FROM golang:1.19

WORKDIR /app
COPY . .

COPY go.mod go.sum ./
RUN go mod download && go mod verify
RUN go install github.com/cosmtrek/air@v1.40.4

CMD ["air", "-c", ".air.toml"]
