# Use an official Python runtime as a parent image
FROM nvidia/cuda:11.0.3-runtime-ubuntu20.04

# Install Python and pip
RUN apt-get update && apt-get install -y python3.11 python3-pip

# Set the working directory in the container to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 8080 available to the world outside this container
EXPOSE 8188

# Run python main.py when the container launches, passing the --enable-cors-header flag
CMD ["python", "main.py", "--enable-cors-header"]
