#!/bin/bash
set -e

echo "Building frontend..."
cd FEBE/Frontend
npm install
npm run build

echo "Installing backend dependencies..."
cd ../backend
pip install -r requirements.txt

echo "Copying frontend dist to backend..."
cp -r ../Frontend/dist ./

echo "Build completed successfully!"
