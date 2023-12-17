# Use the official Node.js 16 image as the base image
FROM node:16

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY . /app

# Install dependencies
RUN npm install

# Expose port 3000 (assuming your React app runs on this port)
EXPOSE 8000

# Start the React application
CMD ["npm", "run", "start:dev"]