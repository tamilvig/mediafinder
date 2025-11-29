# Use the official Python image as base
FROM python:3.11-slim

# Set work directory inside the container
WORKDIR /app

# Install system dependencies (if any, add more if needed)
RUN apt-get update && apt-get install -y --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements.txt if exists, install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy all bot source code
COPY . .

# Expose port if the bot uses webhooks or direct web interface (optional)
# EXPOSE 8000

# Set environment variables (customize as needed)
ENV PYTHONUNBUFFERED=1

# Define entrypoint; update 'bot.py' to your actual entry script
CMD ["python", "bot.py"]
