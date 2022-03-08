FROM golang:1.17-alpine as build

WORKDIR /usr/src/app

COPY . .

RUN go mod init example/hello
RUN go mod tidy
RUN go build

FROM scratch

COPY --from=build /usr/src/app/hello .

ENTRYPOINT [ "./hello" ]
