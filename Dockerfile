# Base image
FROM openjdk:11

# Install Mule runtime
RUN mkdir C:\mule
COPY C:\mule-ee-distribution-standalone-4.4.0.zip C:\mule
RUN powershell.exe -Command "Expand-Archive C:\mule\mule-ee-distribution-standalone-4.4.0.zip -DestinationPath C:\mule"

# Expose Mule ports
EXPOSE 8081
EXPOSE 8091

# Set Mule home and working directory
ENV MULE_HOME C:\mule\mule-ee-distribution-standalone-4.4.0
WORKDIR $MULE_HOME

# Start Mule runtime
CMD ["bin/mule.bat"]
