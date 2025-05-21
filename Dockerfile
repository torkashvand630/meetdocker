
FROM ubuntu:24.04

ARG TARGETPLATFORM

# install deps
RUN apt-get update

RUN  apt-get install -y --no-install-recommends mupdf-tools
RUN  apt-get install -y --no-install-recommends libreoffice
RUN  apt-get install -y --no-install-recommends tini
# clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

LABEL org.opencontainers.image.description=sample
LABEL org.opencontainers.image.version=v0.42
#COPY tini /tini
#RUN chmod +x /tini
RUN mkdir /work && cd /work
WORKDIR /work
ENTRYPOINT ["tini", "--"]
CMD ["/work/x.sh"]
