FROM node:14 
WORKDIR /app 
COPY package.json . 
RUN npm install 
COPY appointment-service.js . 
EXPOSE 3001 
CMD ["node", "appointment-service.js"]