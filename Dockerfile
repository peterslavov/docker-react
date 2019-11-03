# First phase - create a production build
FROM node:alpine as builder

WORKDIR /app

COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Second phase
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
