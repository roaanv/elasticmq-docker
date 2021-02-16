FROM arm64v8/openjdk:11
MAINTAINER Roaan Vos

ENV ELASTICMQ_VERSION=1.1.0

RUN wget -q -O /elasticmq-server.jar https://s3-eu-west-1.amazonaws.com/softwaremill-public/elasticmq-server-${ELASTICMQ_VERSION}.jar


RUN mkdir -p /config
COPY conf/elasticmq.conf /config/elasticmq.conf
COPY conf/queues.conf /config/queues.conf

EXPOSE 9324

ENV ELASTICMQ_OPTS="-Dconfig.file=/config/elasticmq.conf"
#CMD exec java ${ELASTICMQ_OPTS} -jar /elasticmq-server.jar
ENTRYPOINT ["java", "-Dconfig.file=/config/elasticmq.conf", "-Dlogback.configurationFile=/config/logback.xml", "-jar", "/elasticmq-server.jar"]
