# Base image
FROM mcr.microsoft.com/dotnet/sdk:5.0-alpine

# Install PowerShell and Mule runtime
RUN apk add --no-cache \
    ca-certificates \
    less \
    ncurses-terminfo-base \
    krb5-libs \
    libgcc \
    libintl \
    libssl1.1 \
    libstdc++ \
    tzdata \
    userspace-rcu \
    zlib \
    && apk -X https://dl-cdn.alpinelinux.org/alpine/edge/main add --no-cache \
    lttng-ust \
    && apk -X https://dl-cdn.alpinelinux.org/alpine/edge/community add --no-cache \
    icu-libs \
    && apk add --no-cache \
    openssl \
    && wget https://github.com/PowerShell/PowerShell/releases/download/v7.1.5/powershell-7.1.5-linux-alpine-x64.tar.gz \
    && mkdir -p /usr/share/powershell \
    && tar -xzf ./powershell-7.1.5-linux-alpine-x64.tar.gz -C /usr/share/powershell \
    && chmod +x /usr/share/powershell/pwsh \
    && ln -s /usr/share/powershell/pwsh /usr/bin/pwsh \
    && mkdir /mule \
    && wget -O /mule/mule-ee-distribution-standalone-4.4.0.zip https://repository-master.mulesoft.org/nexus/content/repositories/releases/org/mule/distributions/mule-standalone/4.4.0/mule-ee-distribution-standalone-4.4.0.zip \
    && pwsh -Command "Expand-Archive /mule/mule-ee-distribution-standalone-4.4.0.zip -DestinationPath /mule"

# Expose Mule ports
EXPOSE 8081
EXPOSE 8091

# Set Mule home and working directory
ENV MULE_HOME /mule/mule-ee-distribution-standalone-4.4.0
WORKDIR $MULE_HOME

# Start Mule runtime
CMD ["bin/mule"] 
