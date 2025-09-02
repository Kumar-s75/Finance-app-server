# Use official Node.js LTS Alpine image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies (production only)
RUN npm install --omit=dev --legacy-peer-deps

# Copy application source code
COPY . .

# Expose port (for local, Render ignores this)
EXPOSE 8080

# Set NODE_ENV to production
ENV NODE_ENV=production

# Start the app
CMD ["npm", "start"]
