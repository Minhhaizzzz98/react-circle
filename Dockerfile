#hai
FROM node:stretch-slim as build
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
WORKDIR /usr/src/app
COPY . /app
RUN npm install && npm run build
FROM nginx:latest
COPY --from=build /app/build /usr/share/nginx/html