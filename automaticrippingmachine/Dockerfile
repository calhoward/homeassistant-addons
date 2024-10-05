# Use the official Automatic Ripping Machine Docker image as the base
FROM automaticrippingmachine/automatic-ripping-machine:latest

# Copy the run script into the container
COPY run.sh /run.sh

# Make the run script executable
RUN chmod +x /run.sh

# Set the entrypoint to the run script
ENTRYPOINT ["/run.sh"]
