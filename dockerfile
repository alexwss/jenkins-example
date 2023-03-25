# Use the official Node.js v14 image as a base
FROM node:14

# Set the working directory to /app
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install the app's dependencies
RUN npm install

# Copy the rest of the app's files to the container
COPY . .

# Expose port 8090
EXPOSE 8090

# Start the server when the container starts
CMD ["npm", "start"]