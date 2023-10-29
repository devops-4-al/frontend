FROM node:20-alpine AS development

WORKDIR /home/node/app

COPY package*.json ./
RUN npm install

# Copie de tous les fichiers sources
COPY . .

RUN npm run build

FROM node:20-alpine AS build

WORKDIR /home/node/app
COPY package*.json ./
#afficher ce qu'il y'a dans  /home/node/app/dist si il n'y a rien arrater le processus

RUN npm install --only=production

# Copie des fichiers buildés depuis l'étape de développement
COPY --from=development /home/node/app/dist ./dist

# Installation des dépendances de production uniquement
RUN npm install --only=production

#EXPOSE 3000

FROM nginx:alpine as production

#COPY ./config/nginx/app.conf /etc/nginx/conf.d/app.conf


COPY --from=build /home/node/app/dist  /usr/share/nginx/html


