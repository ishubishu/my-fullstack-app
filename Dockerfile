# Step 1: Build the backend (NestJS)

FROM node:16 AS backend-builder

# Set working directory
WORKDIR /app/backend

# Copy package.json and install dependencies
COPY backend/package*.json ./
RUN npm install

# Copy the backend code and build the app
COPY backend ./
RUN npm run build

# Step 2: Build the frontend (React)

FROM node:16 AS frontend-builder

# Set working directory
WORKDIR /app/frontend

# Copy package.json and install dependencies
COPY frontend/package*.json ./
RUN npm install

# Copy the frontend code and build the app
COPY frontend ./
RUN npm run build

# Step 3: Serve the app with nginx

FROM nginx:alpine

# Copy frontend build to nginx's html directory
COPY --from=frontend-builder /app/frontend/build /usr/share/nginx/html

# Copy backend code to a separate directory (optional)
COPY --from=backend-builder /app/backend/dist /app/backend/dist

# Expose port 80 for HTTP traffic
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
