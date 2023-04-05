# Base image
FROM openjdk:11-alpine

# Install Mule runtime
RUN mkdir /mule
COPY ./mule-ee-distribution-standalone-4.4.0.zip /mule
RUN unzip /mule/mule-ee-distribution-standalone-4.4.0.zip -d /mule

# Expose Mule ports
EXPOSE 8081
EXPOSE 8091

# Set Mule home and working directory
ENV MULE_HOME /mule/mule-ee-distribution-standalone-4.4.0
WORKDIR $MULE_HOME

# Start Mule runtime
CMD ["bin/mule"] 
