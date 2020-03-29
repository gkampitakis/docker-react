FROM node:alpine as builder

WORKDIR /app

COPY package.json .

RUN npm install 

COPY . .

RUN npm run build 

# /app/build <--- inside the container contains the production code

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html

# nginx container start automatically