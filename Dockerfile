FROM ekidd/rust-musl-builder as builder

WORKDIR /home/rust/src
COPY --chown=rust:rust . .

RUN cargo build --release --target=x86_64-unknown-linux-musl

FROM alpine:3.12

WORKDIR /

COPY --from=builder /home/rust/src/target/x86_64-unknown-linux-musl/release/prometheus_null_adapter prometheus_null_adapter

RUN apk add --no-cache ca-certificates && update-ca-certificates

ENV SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
ENV SSL_CERT_DIR=/etc/ssl/certs

RUN ["chmod", "a+x", "/prometheus_null_adapter"]

EXPOSE 8080
ENTRYPOINT ["/prometheus_null_adapter"]
