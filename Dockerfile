# Use the official Python image as the base image
FROM python:3.11.9-bullseye

# Set a working directory
WORKDIR /app

# Copy requirements files into the container
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the FastAPI application source code
COPY app.py .

# Command to run application using uvicorn
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8081"]