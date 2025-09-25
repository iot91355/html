# Use lightweight nginx image
FROM nginx:alpine

# Copy HTML files into Nginx web folder
COPY . /usr/share/nginx/html
