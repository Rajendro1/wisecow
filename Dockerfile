# Use an official Ubuntu as a parent image
FROM ubuntu:latest

# It's a good practice to avoid using the "latest" tag in production
# because it can lead to unpredictable behavior if the image gets updated.
# Instead, specify a particular version of Ubuntu to ensure consistency.
# For example: FROM ubuntu:20.04

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Install bash (Ubuntu comes with bash, so this step is not strictly necessary)
# Update apt package list and install fortune-mod and cowsay
RUN apt-get update && \
    apt-get install -y fortune-mod cowsay && \
    # Clean up the apt cache to reduce image size
    rm -rf /var/lib/apt/lists/*

# Make sure the script is executable
RUN chmod +x wisecow.sh

# Run wisecow.sh when the container launches
CMD ["./wisecow.sh"]
