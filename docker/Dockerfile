FROM alpine:3.14 AS builder

RUN apk -U upgrade && \
	apk add alpine-sdk cmake zlib-dev libwebsockets-dev libuv-dev json-c-dev libwebsockets-evlib_uv openssl-dev && \
	git clone --single-branch -b 1.6.3 https://github.com/tsl0922/ttyd.git && \
	cd ttyd && mkdir build && cd build && cmake .. && make 

FROM alpine:3.14

RUN apk -U --no-cache upgrade && \
	apk --no-cache add zlib libwebsockets libuv json-c libwebsockets-evlib_uv openssl postgresql tmux musl-locales && \
	su - postgres -c "pg_ctl initdb -D playground"

COPY --from=builder /ttyd/build/ttyd /
COPY entrypoint.sh /
EXPOSE 7681

ENTRYPOINT [ "/ttyd", "-p", "7681", "/entrypoint.sh" ]

