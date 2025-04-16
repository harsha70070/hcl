FROM node:14 
WORKDIR /app 
COPY package.json . 
RUN npm install 
COPY patient-service.js . 
EXPOSE 3000 
CMD ["node", "patient-service.js"]
