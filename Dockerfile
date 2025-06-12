# Use official Python image as base
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Install nodejs and npm
RUN apt-get update && apt-get install -y curl gnupg && \
    curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean

# Copy frontend and backend files
COPY FEBE/Frontend ./FEBE/Frontend
COPY FEBE/backend ./FEBE/backend
COPY FEBE/backend/requirements.txt ./FEBE/backend/requirements.txt

# Install backend dependencies
RUN pip install --upgrade pip
RUN pip install -r FEBE/backend/requirements.txt

# Build frontend
WORKDIR /app/FEBE/Frontend
RUN npm install
RUN npm run build

# Copy built frontend to backend static folder
RUN cp -r dist ../backend/dist

# Set working directory to backend
WORKDIR /app/FEBE/backend

# Expose port
EXPOSE 8000

# Start the FastAPI app with uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
