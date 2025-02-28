FROM node:16-alpine

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY package.json ./
COPY yarn.lock ./

RUN apk update && \
  apk add git

USER node

RUN yarn

COPY --chown=node:node . .

CMD [ "node", "app.js" ]
