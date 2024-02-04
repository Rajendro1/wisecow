# Use an official Alpine Linux as a parent image
FROM alpine:latest

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Install bash (if needed for your scripts)
RUN apk add --no-cache bash

# Enable community repository and install cowsay
# Attempt to install fortune (if available)
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk update && \
    apk add --no-cache cowsay

# Since fortune is not typically available in the Alpine repos, you might need to skip this or find an alternative method

# Make sure the script is executable
RUN chmod +x wisecow.sh

# Run wisecow.sh when the container launches
CMD ["./wisecow.sh"]
