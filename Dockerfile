FROM node:lts-alpine3.17

WORKDIR /app

COPY ./conv/package.json .

RUN npm install

EXPOSE 8080

COPY ./conv .

CMD [ "node", "server.js" ]
