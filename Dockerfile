
# Use Node.js base image
# FROM node:18

# # Set working directory
# WORKDIR /usr/src/app

# # Copy package files and install dependencies
# COPY package*.json ./
# RUN npm install

# # Copy app source code
# COPY . .

# # Expose port and start app
# EXPOSE 3000
# CMD ["npm", "start"]

# -------- Stage 1: Build --------
FROM node:18 AS builder

WORKDIR /usr/src/app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy source files
COPY . .

# OPTIONAL: if you're building a frontend (React, etc.)
# RUN npm run build


# -------- Stage 2: Runtime --------
FROM node:18-slim

WORKDIR /usr/src/app

# Only copy what is needed from build
COPY --from=builder /usr/src/app .

# Optional: prune dev dependencies if not needed
RUN npm prune --production

EXPOSE 3000

CMD ["npm", "start"]
