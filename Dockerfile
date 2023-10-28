FROM node:latest as build

WORKDIR /var/www

COPY package.json .
COPY package-lock.json .

RUN npm install

COPY . .

RUN npm run build


EXPOSE 5173