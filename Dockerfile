FROM mcr.microsoft.com/java/jre-headless:11-windowsservercore-1809

ENV MULE_HOME=C:\\opt\\mule
ENV MULE_VERSION=4.4.2
ENV MULE_APP_NAME=hello-world

RUN powershell -Command \
    Invoke-WebRequest -Uri ('https://repository.mulesoft.org/nexus/content/repositories/releases/org/mule/distributions/mule-standalone/{0}/mule-standalone-{0}.tar.gz' -f $env:MULE_VERSION) -OutFile 'C:\tmp\mule.tar.gz' ; \
    Expand-Archive -Path 'C:\tmp\mule.tar.gz' -DestinationPath 'C:\opt' ; \
    Remove-Item -Path 'C:\tmp\mule.tar.gz' ; \
    Rename-Item -Path ('C:\opt\mule-standalone-{0}' -f $env:MULE_VERSION) -NewName $env:MULE_HOME

WORKDIR $MULE_HOME\\apps\\$MULE_APP_NAME

COPY target/*.jar .

CMD [ "cmd", "/c", "$env:MULE_HOME\\bin\\mule.cmd" ]
