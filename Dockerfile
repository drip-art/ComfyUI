# Use a base container from ai-dock.
FROM ghcr.io/ai-dock/comfyui:pytorch-2.0.1-py3.10-cuda-11.8.0-base-22.04

# Remove the original ComfyUI directory
RUN rm -rf /opt/ComfyUI

# Copy the current directory contents into the container at /opt/ComfyUI
COPY . /opt/ComfyUI

# Set the working directory in the container to /opt/ComfyUI
WORKDIR /opt/ComfyUI

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port available to the world outside this container
EXPOSE 8188

# Run python main.py when the container launches, passing the --enable-cors-header flag
CMD ["/opt/ai-dock/bin/init.sh"]
