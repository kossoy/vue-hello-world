#!/bin/bash

echo "Vue.js Hello World Docker Deployment Script"
echo "==========================================="

# Build and run with Docker Compose
echo "Building and starting the application..."
docker-compose up --build -d

echo ""
echo "Application is starting up..."
echo "Please wait a moment and then visit: http://localhost:8080"
echo ""
echo "To stop the application, run: docker-compose down"
echo "To view logs, run: docker-compose logs -f"

# Optional: Push to Docker Hub
read -p "Do you want to push to Docker Hub? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    read -p "Enter your Docker Hub username: " username
    docker tag vue-hello-world:latest $username/vue-hello-world:latest
    docker push "$username"/vue-hello-world:latest
    echo "Image pushed to Docker Hub: $username/vue-hello-world:latest"
fi
