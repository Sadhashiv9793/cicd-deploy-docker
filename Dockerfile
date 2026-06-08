# Use the standard multi-platform Node image (keeps it lightweight)
FROM node:lts-alpine

# Set a clean working directory inside the container
WORKDIR /app

# Copy package files first (helps Docker cache layers efficiently)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy everything else (including your src/ folder) into the container
COPY . .

# Expose the port your Express app listens on
EXPOSE 3000

# Run your start script
CMD [ "npm", "run", "start" ]