
### Build productive minimal image and run application on nginx web server.

### Build Phase

FROM node:20-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
# Caution: No CMD here!
# Output: /app/build
RUN npm run build

### Run Phase 

FROM nginx
# Command for documentation purposes only (unless run on AWS Beanstalk)
EXPOSE 80
# Copy just the bare minimum and skip all the spurce and node_modules stuff that's only needed at build time.
WORKDIR /usr/share/nginx/html
COPY --from=builder /app/build .

# docker build . -t sscheffler.eu/docker-react
# docker run -p 8080:80 sscheffler.eu/docker-react
