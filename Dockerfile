FROM ubuntu:16.04
WORKDIR /
# RUN sed -i s/archive.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list \
#     && sed -i s/security.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list \
#     && apt-get clean && apt-get update && apt-get install -y wget \
#     && wget https://github.com/alibaba/MongoShake/releases/download/release-v2.4.16-20201104/mongo-shake-v2.4.16.tar.gz -O -| tar -zxvf -
ADD mongo-shake-v2.4.16.tar.gz /
RUN mv mongo-shake-v2.4.16 mongo-shake
WORKDIR /mongo-shake
ENTRYPOINT ["./collector.linux"]
CMD ["-conf=collector.conf", "-verbose"]