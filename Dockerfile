FROM node:16.15.0-alpine

RUN mkdir -p /usr/src/node-app && chown -R node:node /usr/src/node-app

WORKDIR /usr/src/node-app

COPY package*.json ./

USER node

RUN npm ci --only=production

COPY --chown=node:node . .

EXPOSE 3000

CMD ["npm", "start"]