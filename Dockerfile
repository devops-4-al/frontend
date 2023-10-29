# Stage 1: Development
FROM node:19.0.0-alpine as development

# Set the working directory
WORKDIR /home/node

# Copy package.json and install dependencies
COPY package.json ./
RUN npm install --only=prod

# Copy the source code
COPY --chown=node:node dist ./dist

# Stage 2: Production
FROM node:19.0.0-alpine as production

# Set NODE_ENV to production
ENV NODE_ENV=production

# Set user and working directory
USER node
WORKDIR /home/node

# Copy package.json and installed dependencies from the development stage
COPY --from=development /home/node/package.json ./
COPY --from=development /home/node/node_modules ./node_modules
COPY --from=development /home/node/dist ./dist

# Expose the port
EXPOSE 3000

# Command to start the application
CMD ["npm", "run", "start"]
