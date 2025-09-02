# Use Node.js base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files and install deps
COPY package*.json ./
RUN npm install --omit=dev --legacy-peer-deps


# Copy the rest of the code
COPY . .

# Expose port
EXPOSE 8080

# Start app
CMD ["npm", "start"]
