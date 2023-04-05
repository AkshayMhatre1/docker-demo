FROM mcr.microsoft.com/java/jdk:11-zulu-alpine
LABEL maintainer="Akshay Mhatre"
ENV MULE_HOME=/opt/mule
ARG MULE_VERSION=4.4.0
RUN apk add --no-cache curl && \
    curl -o -L https://repository-master.mulesoft.org/nexus/content/repositories/releases/org/mule/distributions/mule-runtime/${MULE_VERSION}/mule-runtime-${MULE_VERSION}.tar.gz | tar xz && \
    mv mule-enterprise-standalone-${MULE_VERSION} ${MULE_HOME}
EXPOSE 8081
CMD ["/opt/mule/bin/mule"]
