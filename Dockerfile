FROM golang:1.16 as builder
WORKDIR /src/github.com/devinotelecom/prometheus-vmware-exporter
COPY ./ /src/github.com/devinotelecom/prometheus-vmware-exporter
RUN go mod init && go mod tidy
RUN CGO_ENABLED=0 GOOS=linux go build

FROM alpine:3.8
COPY --from=builder /src/github.com/devinotelecom/prometheus-vmware-exporter/prometheus-vmware-exporter /usr/bin/prometheus-vmware-exporter
EXPOSE 9512
ENTRYPOINT ["prometheus-vmware-exporter"]
