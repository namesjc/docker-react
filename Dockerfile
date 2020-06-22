FROM node:14.4.0-alpine3.12 as builder
WORKDIR /app
COPY ["package.json", "package-lock.json*", "./"]
RUN npm install --silent
RUN npm install react-scripts@3.4.1 -g --silent
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

