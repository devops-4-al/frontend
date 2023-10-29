# Use the official Nginx image
FROM nginx:alpine

# Copy Nginx configuration file
COPY ./config/nginx/app.conf /etc/nginx/conf.d/app.conf

# Copy static files from the Node.js application
COPY --from=development /home/node/dist /var/www
