# Base image
FROM python:3.8-slim-buster

# Create app directory
WORKDIR /app

# Copy the requirements file to the working directory
COPY requirements.txt .

# Install dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the application code to the working directory
COPY . .

# Expose port 5000
EXPOSE 5000

# Start the Flask application
CMD ["python3", "app.py"]

