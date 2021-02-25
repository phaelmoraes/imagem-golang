
FROM golang:1.16 as builder
WORKDIR /go/src/app
COPY src/main.go .
RUN go build /go/src/app/main.go

FROM scratch
COPY --from=builder /go/src/app /go/src/app
CMD ["/go/src/app/main"]