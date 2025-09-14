#!/bin/bash

echo "Vue.js Hello World Docker Deployment Script"
echo "==========================================="

# Check if Docker Buildx is available
if ! docker buildx version > /dev/null 2>&1; then
    echo "Error: Docker Buildx is not available. Please update Docker Desktop."
    exit 1
fi

# Create a new builder instance for multi-platform builds
echo "Setting up multi-platform builder..."
docker buildx create --name multiplatform-builder --use --bootstrap 2>/dev/null || docker buildx use multiplatform-builder

# Build ARM64 image for local use (macOS)
echo "Building ARM64 Docker image for local use..."
docker buildx build \
    --platform linux/arm64 \
    --tag vue-hello-world:latest \
    --load \
    .

# Build and run with Docker Compose
echo "Starting the application..."
docker-compose up -d

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
    echo "Building and pushing AMD64 image to Docker Hub..."
    docker buildx build \
        --platform linux/amd64 \
        --tag "$username"/vue-hello-world:latest \
        --push \
        .
    echo "AMD64 image pushed to Docker Hub: $username/vue-hello-world:latest"
    echo "This image will work on AMD64 Linux systems."
fi

# Cleanup: Remove the builder instance
echo "Cleaning up..."
docker buildx rm multiplatform-builder 2>/dev/null || true

echo ""
echo "Deployment complete!"
echo "Local ARM64 image is ready for macOS, and AMD64 image is available on Docker Hub for Linux servers."
