FROM node:16.11.0-alpine as builder
WORKDIR /home/www/keystone
COPY package.json yarn.lock /home/www/keystone/
COPY .keystone/ /home/www/keystone
RUN yarn install

From node:16.11.0-alpine
WORKDIR /home/www/keystone
COPY --from=builder /home/www/keystone/node_modules ./node_modules
COPY . .
RUN yarn postinstall2

EXPOSE 3000

CMD yarn dev
