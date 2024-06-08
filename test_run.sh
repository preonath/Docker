##1. Create the scripts:

		#Python Script: Create a file named hello.py with the following content:
		print("Hello World")
		
		#Bash Script: Create a file named hello.sh with the following content:
		#!/bin/bash
		echo "Hello World"


##2. Create a Dockerfile: This file defines the Docker image.

		# Use an official Python runtime as a parent image
			FROM python:3.8-slim

		# Set the working directory to /app
			WORKDIR /app

		# Copy the current directory contents into the container at /app
			COPY . /app

		# Make port 80 available to the world outside this container
			EXPOSE 80

		# Run hello.py when the container launches
			CMD ["python", "hello.py"]

##3. Build the Docker Image:
		# Run the following command to build your Docker image:
			docker build -t hello-world-app .

##4. Run the Docker Container:
			docker run hello-world-app
