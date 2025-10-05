# Use a newer stable Python base image
FROM python:3.10-slim-bullseye

# Avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends gcc libffi-dev musl-dev ffmpeg aria2 python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy app files
COPY . /app/
WORKDIR /app/

# Install Python requirements
RUN pip3 install --no-cache-dir --upgrade -r requirements.txt

# Run your app
CMD ["python3", "main.py"]
