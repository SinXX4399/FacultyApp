#!/bin/bash
# setup.sh (in FacultyApp root)

#!/bin/bash
echo "==================================="
echo "Faculty App Backend Setup"
echo "==================================="

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Please install Docker first."
    exit 1
fi

if ! command -v docker-compose &> /dev/null; then
    echo "Docker Compose is not installed. Please install Docker Compose first."
    exit 1
fi

# Create necessary directories
echo "Creating directories..."
mkdir -p backend/static backend/logs backend/media

# Copy .env if it doesn't exist
if [ ! -f .env ]; then
    echo "Creating .env file..."
    cp .env.example .env 2>/dev/null || echo "Please create .env file manually"
fi

# Build and start containers
echo "Building and starting Docker containers..."
docker-compose up -d --build

# Wait for services to be ready
echo "Waiting for services to be ready..."
sleep 10

# Check if containers are running
echo "Checking container status..."
docker-compose ps

# Show logs
echo "==================================="
echo "Setup complete!"
echo "API is running at: http://localhost:8000"
echo "API documentation: http://localhost:8000/docs"
echo "Database: localhost:5432"
echo "Redis: localhost:6379"
echo ""
echo "To view logs: docker-compose logs -f"
echo "To stop: docker-compose down"
echo "==================================="