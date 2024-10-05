# Use the official Automatic Ripping Machine Docker image
FROM automaticrippingmachine/automatic-ripping-machine:latest

# Copy the run.sh script to handle configuration
COPY run.sh /app/run.sh

# Ensure the script is executable
RUN chmod +x /app/run.sh

# Run the script
CMD ["/app/run.sh"]
