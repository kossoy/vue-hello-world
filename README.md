# Vue.js Hello World Docker Application

A simple Vue.js 3 "Hello World" application containerized with Docker and ready for deployment.

## Features

- Vue.js 3 with Composition API
- Vite for fast development and building
- Responsive design with gradient background
- Interactive button functionality
- Nginx web server for production
- Multi-stage Docker build for optimized image size
- Docker Compose for easy deployment

## Quick Start

### Using Docker Compose (Recommended)

1. Clone or download this project
2. Navigate to the project directory
3. Run the application:

```bash
docker-compose up --build
```

4. Open your browser and visit: http://localhost:8080

### Using Docker directly

1. Build the Docker image:

```bash
docker build -t vue-hello-world .
```

2. Run the container:

```bash
docker run -p 8080:80 vue-hello-world
```

### Development Mode

1. Install dependencies:

```bash
npm install
```

2. Start development server:

```bash
npm run dev
```

3. Open your browser and visit: http://localhost:3000

## Docker Hub Deployment

To push to Docker Hub:

1. Tag the image:

```bash
docker tag vue-hello-world:latest yourusername/vue-hello-world:latest
```

2. Push to Docker Hub:

```bash
docker push yourusername/vue-hello-world:latest
```

## Google Container Registry Deployment

To push to Google Container Registry:

1. Configure gcloud and authenticate:

```bash
gcloud auth configure-docker
```

2. Tag the image:

```bash
docker tag vue-hello-world:latest gcr.io/your-project-id/vue-hello-world:latest
```

3. Push to GCR:

```bash
docker push gcr.io/your-project-id/vue-hello-world:latest
```

## Project Structure

```
vue-hello-world/
├── src/
│   ├── App.vue          # Main Vue component
│   └── main.js          # Application entry point
├── Dockerfile           # Docker configuration
├── docker-compose.yml   # Docker Compose configuration
├── nginx.conf          # Nginx configuration
├── vite.config.js      # Vite configuration
├── package.json        # Node.js dependencies
└── index.html          # HTML template
```

## Technologies Used

- **Vue.js 3**: Progressive JavaScript framework
- **Vite**: Next generation frontend tooling
- **Docker**: Containerization platform
- **Nginx**: Web server for production
- **Docker Compose**: Multi-container orchestration

## License

MIT License
