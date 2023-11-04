FROM alpine:latest

WORKDIR /root/
ARG TARGETPLATFORM
ARG TINI_ARCH
RUN case ${TARGETPLATFORM} in \
  "linux/arm64")  TINI_ARCH=arm  ;; \
  "linux/386")    TINI_ARCH=32   ;; \
  esac \
  && wget https://cdn.ipip.net/17mon/besttrace4linux.zip \
  && apk add wget unzip \
  && mkdir /root/besttrace4linux \
  && unzip besttrace4linux.zip -d /root/besttrace4linux \
  && cp /root/besttrace4linux/besttrace${TINI_ARCH} /root/besttrace \
  && rm -rf /root/besttrace4linux  /root/besttrace4linux.zip \
  && chmod +x /root/besttrace

ENTRYPOINT ["/root/besttrace"]
