# Use an official Python runtime as a parent image
FROM nvidia/cuda:12.3.1-runtime-ubuntu22.04

# Install Python and pip
ENV TZ=America/New_York
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get install -y python3.11 python3-pip

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
