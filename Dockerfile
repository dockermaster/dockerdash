FROM microsoft/aspnetcore:1.0.1

MAINTAINER Stefan Prodan

# Set Docker remote API address
ENV DOCKER_REMOTE_API="unix:///var/run/docker.sock"

# Set ASP.NET Core environment variables
ENV ASPNETCORE_URLS="http://*:5050"
ENV ASPNETCORE_ENVIRONMENT="Production"

# Copy files to app directory
COPY /release /app

# Set working directory
WORKDIR /app

# Open port
EXPOSE 5050/tcp

# Run
ENTRYPOINT ["dotnet", "DockerDash.dll"]
