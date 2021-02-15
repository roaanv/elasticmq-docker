FROM arm64v8/openjdk:11
MAINTAINER Roaan Vos

ENV ELASTICMQ_VERSION=1.1.0

RUN wget -q -O /elasticmq-server.jar https://s3-eu-west-1.amazonaws.com/softwaremill-public/elasticmq-server-${ELASTICMQ_VERSION}.jar


RUN mkdir -p /config/elasticmq
COPY conf/elasticmq.conf /config/elasticmq/elasticmq.conf
#WORKDIR /elasticmq
#RUN mkdir -p /elasticmq && chown nobody:nobody /elasticmq && chmod 0750 /elasticmq
#USER nobody

ENV ELASTICMQ_OPTS="-Dconfig.file=/config/elasticmq/elasticmq.conf"
CMD exec java ${ELASTICMQ_OPTS} -jar /elasticmq-server.jar
