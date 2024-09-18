FROM golang:bookworm

WORKDIR /app

COPY . .

COPY go.mod go.sum ./
RUN go mod download

COPY . .

COPY wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh

RUN go build -o main .

EXPOSE 8080

ENTRYPOINT ["/wait-for-it.sh", "db:5432", "--", "./main"]