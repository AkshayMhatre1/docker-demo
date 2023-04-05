FROM mcr.microsoft.com/windows/servercore:ltsc2019

LABEL maintainer="Your Name"

ENV MULE_HOME=C:\\mule

WORKDIR C:\\

COPY mule-standalone-4.4.2.zip C:\\mule-standalone-4.4.2.zip

RUN powershell -Command \
    Expand-Archive -Path 'C:\\mule-standalone-4.4.2.zip' -DestinationPath 'C:\\mule'; \
    Remove-Item 'C:\\mule-standalone-4.4.2.zip' -Force

CMD ["C:\\mule\\bin\\mule.bat"]
