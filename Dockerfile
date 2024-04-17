# Use the official Python image  as the base images

FROM  python:3.11.9-bullseye

# Set a working directory

WORKDIR /app

# Copy requirments files into the container

COPY requirements.txt .

 #  install  dependencies

 RUN pip install --no-caache-dir -r requirements.txt


 # Copy the FastApi application source code

 COPY app.ny .

 # Command to run application using uvicorn

 CMD ["uvicorn", "app:app", "--host", "0.0.0.0",  "--port", "8081"]