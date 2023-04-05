FROM openjdk:11

LABEL maintainer="Your Name"

ENV MULE_HOME=C:\\mule

WORKDIR C:\\

COPY mule-ee-distribution-standalone-4.4.0.zip C:\\mule-ee-distribution-standalone-4.4.0.zip

RUN powershell -Command \
    Expand-Archive -Path 'C:\\mule-ee-distribution-standalone-4.4.0.zip' -DestinationPath 'C:\\mule'; \
    Remove-Item 'C:\\mule-ee-distribution-standalone-4.4.0.zip' -Force

CMD ["C:\\mule\\bin\\mule.bat"]
