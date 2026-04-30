FROM node:20-alpine3.21 AS builder
WORKDIR /opt/server
COPY package.json .
COPY *.js .
RUN npm install

FROM node:20-alpine3.21
RUN addgroup -S electronic-shop && adduser -S electronic-shop -G electronic-shop
ENV MONGO="true" \
    MONGO_URL="mongdodb://mongodb:27017/catalogue"
WORKDIR /opt/server
USER electronic-shop
COPY --from=builder /opt/server /opt/server
CMD ["node","server.js"]