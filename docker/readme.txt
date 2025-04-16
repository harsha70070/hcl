
# Use the official Node.js image
FROM node:alpine

# Set the working directory in the container
WORKDIR /app

# Copy the package*.json files to the working directory
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the application code to the working directory
COPY . .

# Expose the port the application will run on
EXPOSE 3000

# Run the command to start the application when the container launches
CMD ["node", "patient-service.js"]


Appointment Service Dockerfile

# Use the official Node.js image
FROM node:alpine

# Set the working directory in the container
WORKDIR /app

# Copy the package*.json files to the working directory
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the application code to the working directory
COPY . .

# Expose the port the application will run on
EXPOSE 3001

# Run the command to start the application when the container launches
CMD ["node", "appointment-service.js"]


Building the Docker Images
To build the Docker images, navigate to the directory containing the Dockerfile for each service and run the following command:


bash
docker build -t patient-service .
docker build -t appointment-service .


Running the Docker Containers
To run the Docker containers, use the following command:


bash
docker run -p 3000:3000 patient-service
docker run -p 3001:3001 appointment-service



project-root/
├── patient-service/
│   ├── patient-service.js
│   ├── package.json
│   └── Dockerfile
├── appointment-service/
│   ├── appointment-service.js
│   ├── package.json
│   └── Dockerfile
└── docker-compose.yml