# Use Node.js base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files and install deps
COPY package*.json ./
RUN npm install --omit=dev --legacy-peer-deps

# Copy the rest of the code
COPY . .

# Set NODE_ENV for production builds
ENV NODE_ENV=production

# Expose port
EXPOSE 8080

# Add healthcheck (Render can detect if service is down)
HEALTHCHECK --interval=30s --timeout=10s --start-period=10s --retries=3 \
  CMD curl --fail http://localhost:8080/ || exit 1

# Start app
CMD ["npm", "start"]
