# Use the latest Debian base image
FROM debian:latest

# Set the working directory
WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    python3 \
    python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Clone the gpt4free repository
RUN git clone https://github.com/xtekky/gpt4free.git /app

# Install Python dependencies
RUN pip3 install --no-cache-dir -r /app/requirements.txt

# Expose the port that the app will run on
EXPOSE 8080

# Set the default command to run the application
CMD ["python3", "-m", "g4f.cli", "gui", "-port", "8080", "-debug"]
