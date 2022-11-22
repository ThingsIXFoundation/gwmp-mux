FROM rust:1.65 as builder
WORKDIR /usr/src/gwmp-mux
COPY . .
RUN cargo install --path .

FROM debian:buster-slim
COPY --from=builder /usr/local/cargo/bin/gwmp-mux /usr/local/bin/gwmp-mux
ENTRYPOINT ["gwmp-mux"]