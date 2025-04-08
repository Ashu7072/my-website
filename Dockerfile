# Use official Nginx image as base
FROM nginx:alpine

# Copy static website files to nginx's public directory
COPY ./html /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Default command to run Nginx
CMD ["nginx", "-g", "daemon off;"]

