# Use the official Node.js image (alpine-based)
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Install any necessary system dependencies (such as bash)
RUN apk add --no-cache bash

# Copy package.json and package-lock.json to install dependencies
COPY package.json package-lock.json ./

# Install dependencies, including npm
RUN npm install --legacy-peer-deps

# Copy the rest of the frontend files into the container
COPY . .

# Expose the port for the frontend
EXPOSE 80

# Command to start the frontend application
CMD ["npm", "start"]
