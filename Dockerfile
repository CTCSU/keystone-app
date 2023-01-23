FROM node:16.11.0

RUN mkdir -p /home/www/keystone
WORKDIR /home/www/keystone

COPY . /home/www/keystone
RUN yarn build

EXPOSE 3000

ENTRYPOINT ["yarn"]
CMD ['dev']
