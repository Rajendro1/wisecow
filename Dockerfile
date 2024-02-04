# Use an official Ubuntu as a parent image
FROM ubuntu:20.04

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Install fortune-mod and cowsay
RUN apt-get update && \
    apt-get install -y fortune-mod cowsay && \
    # Clean up the apt cache to reduce image size
    rm -rf /var/lib/apt/lists/*

# Make sure the script is executable
RUN chmod +x wisecow.sh

EXPOSE 4499

# Run wisecow.sh when the container launches
CMD ["./wisecow.sh"]
