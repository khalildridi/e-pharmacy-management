# Utilisez une image officielle de Node.js comme base
FROM node:14

# Créez et définissez le répertoire de travail
WORKDIR /app

# Copiez les fichiers package.json et package-lock.json
COPY package.json ./

# Installez les dépendances
RUN npm install

# Copiez le reste de votre code dans le conteneur
COPY . .

# Exposez le port que votre application utilise (par exemple 3000)
EXPOSE 3000

# Commande pour démarrer votre application
CMD ["npm", "start"]
