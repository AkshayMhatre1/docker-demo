# Base image
FROM mcr.microsoft.com/powershell:7.1.5-alpine-3.13



# Install Mule runtime
RUN mkdir C:\mule
COPY C:\mule-ee-distribution-standalone-4.4.0.zip C:\mule
# RUN powershell.exe -Command "Expand-Archive C:\mule\mule-ee-distribution-standalone-4.4.0.zip -DestinationPath C:\mule"
RUN pwsh -Command "Expand-Archive C:\mule\mule-ee-distribution-standalone-4.4.0.zip -DestinationPath C:\mule"

# Expose Mule ports
EXPOSE 8081
EXPOSE 8091

# Set Mule home and working directory
ENV MULE_HOME C:\mule\mule-ee-distribution-standalone-4.4.0
WORKDIR $MULE_HOME

# Start Mule runtime
CMD ["bin/mule.bat"]
