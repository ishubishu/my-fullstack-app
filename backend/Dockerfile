# Use an official lightweight Node.js image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first (to optimize Docker caching)
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install --legacy-peer-deps

# Copy only necessary files (excluding node_modules)
COPY . .

# Expose the required port
EXPOSE 3000

# Use Nodemon for development (hot reload)
CMD ["npm", "run", "start:dev"]
