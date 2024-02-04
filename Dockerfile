# Use an official Ubuntu as a parent image
# Specifying a more stable version for better predictability in builds
FROM ubuntu:22.04

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Install required packages including netcat
# Combining update, install, and cleanup in a single RUN to reduce layer size
RUN apt-get update && \
    apt-get install -y fortune-mod cowsay netcat-openbsd && \
    # Clean up the apt cache to reduce image size
    rm -rf /var/lib/apt/lists/*

# Ensure your script is executable
RUN chmod +x wisecow.sh

# Correct way to modify PATH in a Dockerfile
ENV PATH="/usr/games:${PATH}"

# Expose port 4499 if your application uses it
EXPOSE 4499

# Set the default command for the container
CMD ["./wisecow.sh"]
