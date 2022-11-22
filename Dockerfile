FROM rust:1.65 as builder
WORKDIR /usr/src/gwmp-mux
COPY . .
RUN --mount=type=tmpfs,target=/.cargo CARGO_HOME=/.cargo cargo install --path . && cp /.cargo/bin/gwmp-mux /usr/local/bin/gwmp-mux

FROM debian:buster-slim
COPY --from=builder /usr/local/bin/gwmp-mux /usr/local/bin/gwmp-mux
ENTRYPOINT ["gwmp-mux"]