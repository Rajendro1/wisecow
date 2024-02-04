# Use an official Alpine Linux as a parent image
FROM alpine:latest

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Make sure the script is executable
RUN chmod +x wisecow.sh

# Install any needed packages specified in requirements.txt
# Uncomment and modify the following line if you have dependencies
# RUN apk add --no-cache <your-package-list-here>

# Run wisecow.sh when the container launches
CMD ["./wisecow.sh"]
