FROM nginx:alpine

COPY ./config/nginx/app.conf /etc/nginx/conf.d/app.conf

# Copie des fichiers statiques générés depuis l'étape de construction "production" de l'application Node.js
#COPY  /home/node/app/dist  /var/www

# 80
