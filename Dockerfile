FROM debian:wheezy

RUN apt-get update && apt-get install -y wget \
  && wget --no-check-certificate -O /usr/local/bin/minio https://dl.minio.io:9000/updates/2015/Jun/linux-amd64/minio \
  && chmod +x /usr/local/bin/minio \
  && apt-get --purge autoremove -y wget \
  && apt-get clean

EXPOSE 9000 9001

CMD ["sh", "-c", "/usr/local/bin/minio mode memory limit 1G"]