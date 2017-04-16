FROM node:6.10.2

RUN npm install -g hexo-cli

WORKDIR /blog

EXPOSE 4000

COPY . .
