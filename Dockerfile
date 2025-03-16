FROM node:latest

WORKDIR /app/src

COPY package*.json .

RUN npm install

EXPOSE 3000

COPY . ./

CMD [ "node", "index.js"]