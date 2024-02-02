# Usa una imagen base de Node.js
FROM --platform=linux/amd64 node:16

# Establece el directorio de trabajo en la carpeta de la aplicación
WORKDIR /usr/src/app

# Copia los archivos de configuración y las dependencias
COPY package*.json ./

# Instala las dependencias
RUN npm install

# Copia el resto de la aplicación
COPY . .

# Compila la aplicación TypeScript
RUN npm run build

# Expone el puerto en el que la aplicación estará escuchando
EXPOSE 3001

# Comando para ejecutar la aplicación
CMD ["npm", "run", "start:dev"]