FROM node:10

WORKDIR /usr/src/app/my-app

COPY package*.json ./

RUN npm install

EXPOSE 8080

CMD ["npm", "run", "serve"]