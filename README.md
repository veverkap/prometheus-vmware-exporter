# prometheus-vmware-exporter
Collect metrics ESXi Host - originally https://github.com/devinotelecom/prometheus-vmware-exporter

## Build
```sh
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7,linux/ppc64le -t ghcr.io/veverkap/prometheus-vmware-exporter . --push
```

## Run
```sh
docker run -b \
  --restart=always \
  --name=ghcr.io/veverkap/prometheus-vmware-exporter \
  --env=ESX_HOST esx.domain.local \
  --env=ESX_USERNAME user \
  --env=ESX_PASSWORD password \
  --env=ESX_LOG debug \
  prometheus-vmware-exporter
```
