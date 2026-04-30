FROM node:20-alphine3.21 AS builder
WORKDIR /opt/server
COPY package.json .
COPY *.js .
RUN npm install

FROM node:20-alphine3.21
RUN addgroup -S electronic-shop && adduser -S electronic-shop -G electronic-shop
RUN chown -R electronic-shop:electronic-shop /opt/server
ENV MONGO="true" \
    MONGO_URL="mongdodb://mongodb:27017/catalogue"
USER electronic-shop
COPY --from=builder /opt/server /opt/server
WORKDIR /opt/server
CMD ["node","server.js"]