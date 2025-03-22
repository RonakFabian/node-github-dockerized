#Stage 1: Builder

FROM node:18-alpine3.20 AS builder

WORKDIR /app

COPY package*.json  ./

RUN apk update && apk add npm

RUN npm install

COPY . .

RUN npm run build


#Stage 2: Installer

FROM  node:18-alpine3.20 AS installer

WORKDIR /app  

COPY --from=builder /app/dist ./dist  
COPY --from=builder /app/node_modules ./node_modules  

EXPOSE 3000

CMD ["node", "dist/index.js"]
