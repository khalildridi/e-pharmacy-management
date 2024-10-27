# FROM node:12.18-alpine
# ENV NODE_ENV production
# WORKDIR /usr/src/app
# COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
# RUN npm install --production --silent && mv node_modules ../
# COPY . .
# EXPOSE 8080
# CMD npm start
# Étape 1 : Construction de l'application
FROM node:12.18-alpine AS build

# Créez et définissez le répertoire de travail
WORKDIR /usr/src/app

# Copiez les fichiers de dépendance
COPY ["package.json", "package-lock.json*","npm-shrinkwrap.json*", "./"]


# Installez les dépendances
RUN npm install 

# Copiez le reste des fichiers de votre application
COPY . .

# Construisez l'application Angular
RUN npm run build --prod

# Étape 2 : Configuration du serveur de production
FROM nginx:alpine

# Copiez les fichiers construits dans le répertoire de Nginx
COPY --from=build /usr/src/app/dist/your-angular-app /usr/share/nginx/html

# Exposez le port sur lequel Nginx écoute
EXPOSE 80

# Commande pour démarrer Nginx
CMD ["nginx", "-g", "daemon off;"]
